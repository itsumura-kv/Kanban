DB設計書
===

## SAMPLE
|英語名|型|null許可|ユニーク|説明|外部キー|
|:---:|:---:|:---:|:---:|:---:|:---:|
|---|---|---|---|---|---|


## ユーザー
|クラス名|テーブル名|
|:---:|:---:|
|User|users|

|英語名|型|null許可|ユニーク|説明|外部キー|
|:---:|:---:|:---:|:---:|:---:|:---:|
|id|int|---|---|---|---|
|name|string|---|---|名前|---|
|password|string|---|---|パスワード|---|
|email|string|---|O|メールアドレス|---|
|uid|string|---|O|SNSのユーザーID|---|
|icon_path|text|O|O|アイコンの画像ファイルのパス|---|
|unsubscribe_flag|bool|---|---|サービスから退会したかどうかのフラグ|---|
|provider|string|---|---|SNS名|---|

```
bundle exec spring stop
bundle exec rails g devise:install
bundle exec rails g devise user
```
```
bundle exec rails g model User name:string password:string email:string icon_path:text unsubscribe_flag:boolean
bundle exec rails g migration AddColumnsToUsers uid:string provider:string
```

## プロジェクト
|クラス名|テーブル名|
|:---:|:---:|
|Project|projects|

|英語名|型|null許可|ユニーク|説明|外部キー|
|:---:|:---:|:---:|:---:|:---:|:---:|
|id|int|---|---|---|---|
|title|string|---|---|プロジェクト名|---|
|content|text|---|---|概要|---|
|admin_user_id|int|---|---|管理者ID|---|

title:140字
content:300字

```
bundle exec rails g model Project title:string content:text admin_user_id:int
```

## プロジェクト - ユーザー 中間テーブル
|クラス名|テーブル名|
|:---:|:---:|
|ProjectUser|project_users|

|英語名|型|null許可|ユニーク|説明|外部キー|
|:---:|:---:|:---:|:---:|:---:|:---:|
|id|int|---|---|---|---|
|project_id|int|---|---|---|Project.id|
|user_id|int|---|---|---|User.id|

```
bundle exec rails g model ProjectUser project:references user:references
```

## カラム
|クラス名|テーブル名|
|:---:|:---:|
|Column|columns|

|英語名|型|null許可|ユニーク|説明|外部キー|
|:---:|:---:|:---:|:---:|:---:|:---:|
|id|int|---|---|---|---|
|title|string|---|---|---|---|
|project_id|int|---|---|---|Project.id|

title:40字
同一プロジェクトでユニーク

```
bundle exec rails g model Column title:string project:references
```

## カード
|クラス名|テーブル名|
|:---:|:---:|
|Card|cards|

|英語名|型|null許可|ユニーク|説明|外部キー|
|:---:|:---:|:---:|:---:|:---:|:---:|
|id|int|---|---|---|---|
|title|string|---|---|---|---|
|user_id|int|---|---|担当者|User.id|
|due_date|date|---|---|期日|---|
|column_id|int|---|---|---|Column.id|

title:40字
同一プロジェクトでユニーク

```
bundle exec rails g model Card title:string user:references due_date:date column:references
```

## ユーザー招待
|クラス名|テーブル名|
|:---:|:---:|
|Invitation|invitations|

|英語名|型|null許可|ユニーク|説明|外部キー|
|:---:|:---:|:---:|:---:|:---:|:---:|
|id|int|---|---|---|---|
|inviter|int|---|---|招待した人|User.id|
|invitee|int|---|---|招待された人|User.id|
|project_id|int|---|---|---|Project.id|
|has_read|bool|---|---|既読フラグ|---|

```
bundle exec rails g model Invitation inviter:integer invitee:integer project:references has_read:boolean
```

## プロジェクトログ
|クラス名|テーブル名|
|:---:|:---:|
|Log|logs|

|英語名|型|null許可|ユニーク|説明|外部キー|
|:---:|:---:|:---:|:---:|:---:|:---:|
|id|int|---|---|---|---|
|content|string|---|---|---|---|
|project_id|int|---|---|---|Project.id|

```
bundle exec rails g model Log content:string project:references
```