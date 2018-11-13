URL
===

## トップページ・プロジェクト一覧
|説明|メソッド|URI|コントローラー|
|:---:|:---|:---|:---|
|表示|GET|/|root#index|

## ログイン・新規登録画面
|説明|メソッド|URI|コントローラー|
|:---:|:---|:---|:---|
|表示|GET|/login/index|login#index|
|DB登録|POST|/login/create|user#create|
|ログイン|POST|/session/create|session#create|
|成功後リダイレクト|GET|/|root#index|

## マイページ
|説明|メソッド|URI|コントローラー|
|:---:|:---|:---|:---|
|表示|GET|/mypage|mypage#index|
|更新|POST|/mypage/update|mypage#update|
|成功後リダイレクト|GET|/mypage|mypage#index|
|ログアウト|POST|/logout|session#destroy|
|成功後リダイレクト|GET|/|root#index|
|退会|POST|/{user_id}/destroy|user#destroy|