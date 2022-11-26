# IT資産管理ツール「Snipe-IT」


## .envファイル作成

APP_URL=http://192.168.xxx.xxx:3051は、自身の環境を入力して下さい。

## APP_KEYを取得

snipe_snipe-it_1内で、APP_KEYを取得します。

```sh
docker exec -i -t snipe_snipe-it_1 bash
 
# php artisan key:generate
**************************************
*     Application In Production!     *
**************************************
 
 Do you really wish to run this command? (yes/no) [no]:
 > yes
 
Application key [base64:HCJmCbfLbA/icTS1BHBwRAflAy0osnfw+POSiRB6W4w=] set successfully.
 
# exit
```

作成したKEYを「.env」ファイルに記述します。
APP_KEY=base64:HCJmCbfLbA/icTS1BHBwRAflAy0osnfw+POSiRB6W4w=

## firewallを設定

```sh
sudo firewall-cmd --add-port=3051/tcp --zone=public --permanent
sudo firewall-cmd --reload
```

## 起動

```sh
docker-compose up -d
```

## アクセス

http://127.0.0.1:3051/