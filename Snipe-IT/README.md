# IT���Y�Ǘ��c�[���uSnipe-IT�v


## .env�t�@�C���쐬

APP_URL=http://192.168.xxx.xxx:3051�́A���g�̊�����͂��ĉ������B

## APP_KEY���擾

snipe_snipe-it_1���ŁAAPP_KEY���擾���܂��B

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

�쐬����KEY���u.env�v�t�@�C���ɋL�q���܂��B
APP_KEY=base64:HCJmCbfLbA/icTS1BHBwRAflAy0osnfw+POSiRB6W4w=

## firewall��ݒ�

```sh
sudo firewall-cmd --add-port=3051/tcp --zone=public --permanent
sudo firewall-cmd --reload
```

## �N��

```sh
docker-compose up -d
```

## �A�N�Z�X

http://127.0.0.1:3051/