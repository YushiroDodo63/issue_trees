# 概要
"Tree for All Engineers" をコンセプトに、木構造でプロジェクト・メンバーを簡単かつ効率的に管理し、自分の持ってるタスク一覧を確認できるWebアプリケーション。

# 開発背景・目的
チーム開発で、複数のプロジェクトに関わることで、
- 複数のプロジェクトに関わっているとき、タスクが多すぎて管理できない
- プロジェクトの全体像が分からない
- だれがどのプロジェクトに関わってるか管理しきれない
- だれがどの技術スタックがあるか、把握しきれない
- 自分の持っているタスクを把握しきれない  

などの問題が発生する。  
そこで、木構造によってプロジェクト全体の管理を効率化することでエンジニアの開発を支援し、  
プロジェクト管理に必要だったリソースを自身のスキルアップに使えるようにした。  


# 使い方
## サインイン・サインアップ
https://efficientree.o2srv.net/
にアクセスし、初めての利用は `SIGN UP`を選択し、ユーザ名・メールアドレス・パスワードを入力して `SIGN UP`をクリック。  
2回目以降は `SIGN IN`を選択し、メールアドレス・パスワードを入力して `SIGN IN`をクリック。  

## スキルの追加
1. サインイン・サインアップ後に遷移する画面もしくは画面右上のアカウントマークをクリックし、 `ユーザ情報詳細` をクリック  
2. Personal InformationのMY SKILLタブを選択し、`追加` ボタンをクリック  
3. セレクトボックスから自分の持っているスキルを選択（複数選択可能）し、`EDIT` をクリック
![image](https://user-images.githubusercontent.com/71711872/134709376-a177fa1b-d160-48fa-9947-f51cfa84f955.png)

## プロジェクトの追加
1. サイドバーの`Add Project` をクリック  
2. 一番上のテキストボックスにプロジェクトの名前を入力
3. プロジェクトにアサインするメンバーを選択
4. プロジェクトに紐付くノード数を選択し、そのノードの名前を入力（Clientと呼ぶ）
5. Clientに紐づくノード数（issue数）を選択し、各issueの名前・説明・使用技術・issueのレベル・割り当てるMemberをそれぞれ入力
6. 全て入力4たことを確認し、ページ下部中央の`登録` ボタンを押す。

注意事項：全て入力されていないとうまくTreeができないので、全て入力されたことを確認してください。

## Tree画面
1. プロジェクト登録後に遷移する画面もしくはサイドバーの`ProjectTree`をクリック
2. 木構造で確認したいProjectを左上のセレクトボックスから選択
  
### Tree本体に関する操作
前提条件：一番上のノードをProject、中間のノードをClient、一番下のノードをissueと呼びます。  
- Clientノードの追加 
  1. projectノードの名前部分をクリック
  2. 出現したダイアログに新しく追加するClientの名前を入力
  3. ADDボタンをクリック

- Issueノードの追加
  1. Clientノードの名前部分をクリック
  2. issueの名前、issueの説明、issueに使用する技術、issueのレベル、issueに割り当てるメンバーを入力
  3. ADD ボタンをクリック

- Clientノードの編集
  1. Clientノードの名前部分をクリック
  2. ダイアログ上部右側の鉛筆マークをクリック
  3. Clientの名前を修正
  4. EDIT ボタンをクリック

- Issueノードの編集
  1. Issueノードの名前部分をクリック
  2. ダイアログ上部右側の鉛筆マークをクリック
  3. issueの名前、issueの説明、issueに使用する技術、issueのレベル、issueに割り当てるメンバーを修正
  4. EDIT ボタンをクリック

- Treeの見た目を変更する
  - Project, Cliantのノード本体（黒い部分）をクリックすることで、クリックしたノード以下のノードが畳まれる。
  - 木構造の左側にある` Tree Options` の各値を変更することで見た目を変更できる。

![tree](https://user-images.githubusercontent.com/71711872/134756995-0179ed5a-516f-4a8d-88cc-d289aaa16a3c.gif)


### 表示しているプロジェクトに関わるメンバーの確認・編集
- 表示しているプロジェクトに関わるメンバーは、木構造の左側にある`members` に名前、持つ技術スタックの確認が可能
- メンバーの追加
  1. 木構造の左側にある`members` の下部にある`MANAGEMENT MEMBERS` をクリック
  2. 表示されたダイアログのセレクトボックスから、プロジェクトに追加したいユーザを選択（複数選択可能）
  3. ADD ボタンをクリック
- メンバーの削除
  1. 木構造の左側にある`members` の下部にある`MANAGEMENT MEMBERS` をクリック
  2. 表示されたダイアログのセレクトボックスから、プロジェクトから削除したいユーザ名をクリック
  3. 表示されたダイアログの REMOVE ボタンをクリック

![management member](https://user-images.githubusercontent.com/71711872/134757004-4e511ea0-fa28-412d-8a39-086cf64794e0.gif)


---
---
# 使用技術等
Vue.js, Vuetify, Vuex, Node.js, Ruby on Rails, MySQL, docker, docker-compose, Github

## 木構造で使用したNode.jsのパッケージ
https://github.com/David-Desmaisons/Vue.D3.tree


# モデル図
![image](https://user-images.githubusercontent.com/71711872/133971611-29b2d691-0b9f-4afd-8bc1-30074f681e4f.png)
