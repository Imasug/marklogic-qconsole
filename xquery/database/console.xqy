xquery version "1.0-ml";

(: ドキュメントをDBへ入れたい場合 :)
xdmp:document-insert("/test.xml", <test>test</test>);

(: ローカルファイルをDBに入れたい場合 :)
xdmp:load("C:\Users\SI\Desktop\qconsole\xquery\database\test.xlsx", "/test.xlsx");

(: ドキュメントを消したい場合 :)
xdmp:document-delete("/test.xlsx");

(: ドキュメントを更新したい場合 :)
xdmp:node-replace(fn:doc("/test.xml")/test, <test>replace</test>);

(: 対象のDBに格納されているドキュメントをすべて取得したい場合 :)
fn:doc();
fn:collection();

(: ログを出力したい場合 :)
(: $MARKLOGIC_HOME/Data/Logs/ErrorLog.txtに出力される :)
xdmp:log("test");

(: ドキュメントの存在確認をしたい場合 :)
if (fn:doc-available("/test.xml")) then
    ("/test.xmlは存在します。")
else
    ("/test.xmlは存在しません。");

(: ドキュメントの中身を見たい場合 :)
fn:doc("/test.xml")/test

(: TODO できれば他の言語の基本文法と合わせて作りたい。 :)