# telegram-cli Downloader

Automate downlaods from a Telegram channel

## Usage

This will initiate the authentication process. Once it's completed, the auth files will be saved in the config volume

```
docker run -e CHAT_NAME=Channel_Name \
    -v PATH_TO_CONFIG_DIR:/volumes/config \
    -v PATH_TO_DOWNLOADS_DIR:/volumes/downloads \
    victor141516/telegram-cli-downloader
```

Run it again to start the service.

The download directory will contain 2 directories (incomplete and complete).
