# ibs-alt
ios backup extractor (alternate version)

## USAGE

1. Backup iPhone data with iTunes (no encryption mode)
2. Download source code
3. Open terminal (or CMD, Powershell, etc.) in source code folder
4. Run `ios_backup_extractor.exe` to check backup ID (Serial Number)

    ```
    > ios_backup_extractor.exe --list

                            Available iOS Device Backups
    --------------- --------------- -------------- ------------------ -----------
    Serial Number   Name            Device         Backup Date        Encrypted
    --------------- --------------- -------------- ------------------ -----------
    G0NXR5W4KXLN    iphone          iPhone XR      2024-08-29 14:15       No
    ```
5. Run `extract.cmd` with Backup ID and Output Folder

    ```
    > extract.cmd -b "G0NXR5W4KXLN" -o "media"
    ```
