# ベースイメージ
FROM amazonlinux:2

# 同一ディレクトリの公開鍵ファイルを Docker イメージの /tmp ディレクトリにコピーする
COPY ./id_rsa.pub /tmp/

# インストール済みのパッケージを最新版にアップデート
RUN yum -y update && \
    # 追加で必要なパッケージをインストール
    yum -y install \
        sudo \
        shadow-utils \
        procps \
        wget \
        openssh-server \
        openssh-clients \
        which \
        iproute \
        e2fsprogs \
        java-1.8.0-openjdk-devel.x86_64 \
        unzip && \
    # キャッシュを削除
    yum clean all && \
    # setuptools をインストール
    wget https://bootstrap.pypa.io/ez_setup.py -O - | sudo python && \
    # SSH サーバを起動
    systemctl enable sshd.service && \
    # パスワード認証による SSH アクセスを禁止
    echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
    # ec2-user を追加
    useradd ec2-user && \
    # ec2-user で sudo コマンドを使用できるようにする
    echo "ec2-user ALL=NOPASSWD: ALL" >> /etc/sudoers && \
    # ec2-user のホームディレクトリ下に公開鍵を配置
    sudo -u ec2-user mkdir -p /home/ec2-user/.ssh && \
    mv /tmp/id_rsa.pub /home/ec2-user/.ssh/ && \
    chmod -R go-rwx /home/ec2-user/.ssh && \
    # 公開鍵を登録
    cat /home/ec2-user/.ssh/id_rsa.pub >> /home/ec2-user/.ssh/authorized_keys && \
    # ロケールを設定
    echo "export LANG=en_US.UTF-8" >> /home/ec2-user/.bash_profile

