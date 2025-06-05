# コーヒー豆SNSアプリ システム設計

## 概要
購入したコーヒー豆を記録し、他のユーザーと共有できるモバイルアプリを想定しています。フロントエンドはFlutterで実装し、バックエンドはRuby on RailsのAPIモードで構築します。Packwerkを用いてドメインごとにモジュールを分割し、DDDの考え方を取り入れ、ドメインロジックを中心とした設計を行います。

## 主要機能
- **SNS機能**: ユーザー同士のフォロー、投稿、コメント
- **コーヒー評価機能**: 豆ごとの評価点数とテイスティングノートの記録
- **コーヒー種類・焙煎度設定**: 原産国、品種、精製方法、焙煎度合いなどを設定可能
- **店舗記録機能**: 購入店舗や焙煎所を記録

## 利用予定ライブラリ
- `rails` : APIサーバーの基盤
- `packwerk` : パッケージ分割と依存関係管理
- `devise` / `devise-jwt` : 認証とJWT発行
- `rspec-rails` : テストフレームワーク
- `active_model_serializers` または `fast_jsonapi` : JSONレスポンス生成
- `sidekiq` : バックグラウンドジョブ
- `rubocop` : コード解析
- `dotenv-rails` : 環境変数管理

## アーキテクチャ
- **モバイルアプリ (フロントエンド)**: Flutterで実装し、APIと通信してユーザーにUIを提供
- **APIサーバー (バックエンド)**: Packwerkで分割した各ドメインをRailsで実装
- **データベース**: PostgreSQLを想定

## ドメインモデル
### User
- 属性: username, email, encrypted_password, profile
- 関連: CoffeeBean投稿、Rating、Follow

### CoffeeBean
- 属性: name, origin, variety, roast_level, tasting_notes, purchased_at, store_id, user_id
- 関連: UserおよびStoreに属し、複数のRatingを持つ

### Rating
- 属性: score(1-5), comment, coffee_bean_id, user_id
- 関連: User, CoffeeBeanに属する

### Store
- 属性: name, location, website
- 関連: 複数のCoffeeBeanを持つ

## API例
- `POST /api/v1/users` – 新規ユーザー登録
- `POST /api/v1/sessions` – ログインしてトークン取得
- `POST /api/v1/coffee_beans` – コーヒー豆を登録
- `GET /api/v1/coffee_beans` – コーヒー豆一覧を取得（ユーザーや店舗で絞り込み可）
- `POST /api/v1/ratings` – コーヒー豆の評価投稿
- `POST /api/v1/follows` – ユーザーをフォロー

## Packwerk パッケージ
- `packs/users` – 認証とSNS機能
- `packs/beans` – コーヒー豆のドメインロジック
- `packs/ratings` – 評価機能
- `packs/stores` – 店舗管理
- `packs/shared` – 共通コード

## データフロー
1. モバイルアプリがリクエストを送信
2. APIサーバーで認証後、該当パッケージにルーティング
3. パッケージ内でドメインロジックを実行し、ActiveRecordを通じて保存
4. 結果をJSONで返却

## その他考慮点
- JWTによるステートレス認証
- よく検索されるカラムにインデックスを付与
- 通知などの時間がかかる処理はSidekiqで実行
- ドメインロジックはサービスクラスやモデルに集約し、コントローラは薄く保つ

