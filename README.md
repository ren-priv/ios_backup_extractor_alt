# ibs-alt
ios backup extractor (alternate version)

## USAGE

1. Backup iPhone Data with iTunes (make sure no encryption)
2. Check Backup Serial Number
    ```
    > ios_backup_extractor.exe --list

                            Available iOS Device Backups
    --------------- --------------- -------------- ------------------ -----------
    Serial Number   Name            Device         Backup Date        Encrypted
    --------------- --------------- -------------- ------------------ -----------
    G0NXR5W4KXLN    iphone          iPhone XR      2024-08-29 14:15       No
    ```
3. Run extract.cmd with Backup Serial Number and Output Folder
    ```
    > extract.cmd -b "G0NXR5W4KXLN" -o "media"
    ```
