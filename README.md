# slide-capture
SlideCaptureは発表スライドを自動で撮影、Twitterへアップするツールです。  
スクリーンが撮せる位置にカメラつきRaspberry Piを固定し、ツールを実行することで、全自動でスライドが変わったタイミングを見計らって写真を撮影、Twitterへハッシュタグ付きでアップします。  
これにより、勉強会の参加者は自分でスライドを枚ずつ撮影する必要がなくなり、発表に集中できるようになります。

# 必要なもの
* Raspberry Pi 3
* カメラモジュール
* Azureアカウント
* Twitterアカウント

# 事前準備

AzureのBlob Storageを作成します。

Azure CLIをインストールし、ログインします。

```
$ az login
```

Custom Vision Serviceに教師データを登録します。  
TODO: Logic Apps経由で共通のプロジェクト使えるようにできるか検討する。

# 設置手順

Raspberry Piにプロジェクトをクローンします。

```
$ git clone https://github.com/chooyan-eng/slide-capture.git
```

`config.ini`ファイルに、Custom Vision Service APIを利用するための各パラメータを記載します。

```
$ vi config.ini

[CustomVision]
Prediction-key = f39ff00e5eexxxxxxxxxxxxxxxx
iteration_id = c812a3b6-xxxxxx-xxxx-xxxx-xxxxxx
project = b7994564-xxxxxx-xxxxxxx-xxxxxxx-xxxxx
```

Blob Storageのアカウントとアクセスキーを環境変数にセットします。

```
$ export AZURE_STORAGE_ACCOUNT=slidecapturestorage
$ export AZURE_STORAGE_ACCESS_KEY=tFs6YohP8Bhxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

カメラをセットします。  

以下のコマンドをcronにセットします。

```
$ 
```
