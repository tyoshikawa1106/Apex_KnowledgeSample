/*
 * ナレッジ処理のサンプル・コントローラーテストクラス
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdDate      : 2013/01/01
 * @createdName      : TAIKI,YOSHIKAWA
 * ----------------------------------------
 * @lastModifiedDate : 2013/01/01
 * @lastModifiedName : TAIKI,YOSHIKAWA
 * ----------------------------------------
 */
@isTest
private class KnowledgeSampleControllerTest {

	/*
	 * コンストラクタ・テスト
	 */
    static testMethod void KnowledgeSampleControllerTest() {
        System.debug('◆◆◆◆KnowledgeSampleControllerTest:START');
        
        // ユーザ取得
        User user = getUser();
        
        // テスト実施
        System.RunAs(user) {
            
            // カレントページにパラメータを設定
            PageReference pageRef = getPageReference();
            Test.setCurrentPage(pageRef);
            
            // テスト開始
            Test.startTest();
            
            // コンストラクタ
            KnowledgeSampleController cls = new KnowledgeSampleController();
            
            // テスト終了
            Test.stopTest();
        }
        
        System.debug('◆◆◆◆KnowledgeSampleControllerTest:END');
    }
    
    /*
	 * Knowledgeのデータ作成・テスト
	 */
    static testMethod void createKnowledgeTest() {
        System.debug('◆◆◆◆createKnowledgeTest:START');
        
        // ユーザ取得
        User user = getUser();
        
        // テスト実施
        System.RunAs(user) {
            
            // カレントページにパラメータを設定
            PageReference pageRef = getPageReference();
            Test.setCurrentPage(pageRef);
            
            // コンストラクタ
            KnowledgeSampleController cls = new KnowledgeSampleController();
            
            // テスト開始
            Test.startTest();
            
            // Knowledgeのデータ作成
            Knowledge__kav knowledge = cls.createKnowledge();
            System.assertNotEquals(knowledge, new Knowledge__kav());
            
            // テスト終了
            Test.stopTest();
        }
        
        System.debug('◆◆◆◆createKnowledgeTest:END');
    }
    
    /*
	 * Knowledgeの情報取得・テスト
	 */
    static testMethod void getKnowledgeTest() {
        System.debug('◆◆◆◆getKnowledgeTest:START');
        
        // ユーザ取得
        User user = getUser();
        
        // テスト実施
        System.RunAs(user) {
            
            // カレントページにパラメータを設定
            PageReference pageRef = getPageReference();
            Test.setCurrentPage(pageRef);
            
            // コンストラクタ
            KnowledgeSampleController cls = new KnowledgeSampleController();
            // Knowledgeのデータ作成
            Knowledge__kav knowledge = cls.createKnowledge();
            
            // テスト開始
            Test.startTest();
            
            // Knowledgeのデータ取得
            Knowledge__kav knowledgeDraft = cls.getKnowledgeIsDraft();
            System.assertEquals(knowledgeDraft.PublishStatus, 'Draft');
            
            // テスト終了
            Test.stopTest();
        }
        
        System.debug('◆◆◆◆getKnowledgeTest:END');
    }
    
    /*
	 * Knowledgeの更新(Online)・テスト
	 */
    static testMethod void doUpdateKnowledgeOnlineTest() {
        System.debug('◆◆◆◆doUpdateKnowledgeOnlineTest:START');
        
        // ユーザ取得
        User user = getUser();
        
        // テスト実施
        System.RunAs(user) {
            
            // カレントページにパラメータを設定
            PageReference pageRef = getPageReference();
            Test.setCurrentPage(pageRef);
            
            // コンストラクタ
            KnowledgeSampleController cls = new KnowledgeSampleController();
            // Knowledgeのデータ作成
            Knowledge__kav knowledge = cls.createKnowledge();
            // Knowledgeのデータ取得
            Knowledge__kav knowledgeDraft = cls.getKnowledgeIsDraft();
            System.assertEquals(knowledgeDraft.PublishStatus, 'Draft');
            
            // テスト開始
            Test.startTest();
            
            // Knowledgeの更新(Online)
            cls.doUpdateKnowledgeOnline(knowledgeDraft);
            
            // テスト終了
            Test.stopTest();
        }
        
        System.debug('◆◆◆◆doUpdateKnowledgeOnlineTest:END');
    }
    
    /*
	 * Knowledgeの取得(Online)・テスト
	 */
    static testMethod void getKnowledgeIsOnlineTest() {
        System.debug('◆◆◆◆getKnowledgeIsOnlineTest:START');
        
        // ユーザ取得
        User user = getUser();
        
        // テスト実施
        System.RunAs(user) {
            
            // カレントページにパラメータを設定
            PageReference pageRef = getPageReference();
            Test.setCurrentPage(pageRef);
            
            // コンストラクタ
            KnowledgeSampleController cls = new KnowledgeSampleController();
            // Knowledgeのデータ作成
            Knowledge__kav knowledge = cls.createKnowledge();
            // Knowledgeのデータ取得(Draft)
            Knowledge__kav knowledgeDraft = cls.getKnowledgeIsDraft();
            System.assertEquals(knowledgeDraft.PublishStatus, 'Draft');
            // Knowledgeの更新(Online)
            cls.doUpdateKnowledgeOnline(knowledgeDraft);
            
            // テスト開始
            Test.startTest();
            
            // Knowledgeのデータ取得(Online)
            Knowledge__kav knowledgeOnline = cls.getKnowledgeIsOnline();
            System.assertEquals(knowledgeOnline.PublishStatus, 'Online');
            
            // テスト終了
            Test.stopTest();
        }
        
        System.debug('◆◆◆◆getKnowledgeIsOnlineTest:END');
    }
    
    /*
	 * Knowledgeの更新(Archived)・テスト
	 */
    static testMethod void doUpdateKnowledgeArchivedTest() {
        System.debug('◆◆◆◆doUpdateKnowledgeArchivedTest:START');
        
        // ユーザ取得
        User user = getUser();
        
        // テスト実施
        System.RunAs(user) {
            
            // カレントページにパラメータを設定
            PageReference pageRef = getPageReference();
            Test.setCurrentPage(pageRef);
            
            // コンストラクタ
            KnowledgeSampleController cls = new KnowledgeSampleController();
            // Knowledgeのデータ作成
            Knowledge__kav knowledge = cls.createKnowledge();
            // Knowledgeのデータ取得
            Knowledge__kav knowledgeDraft = cls.getKnowledgeIsDraft();
            System.assertEquals(knowledgeDraft.PublishStatus, 'Draft');
            // Knowledgeの更新(Online)
            cls.doUpdateKnowledgeOnline(knowledgeDraft);
            // Knowledgeのデータ取得(Online)
            Knowledge__kav knowledgeOnline = cls.getKnowledgeIsOnline();
            System.assertEquals(knowledgeOnline.PublishStatus, 'Online');
            
            // テスト開始
            Test.startTest();
            
            // Knowledgeの更新(Archived)
            cls.doUpdateKnowledgeArchived(knowledgeOnline);
            
            // テスト終了
            Test.stopTest();
        }
        
        System.debug('◆◆◆◆doUpdateKnowledgeArchivedTest:END');
    }
    
    /*
	 * Knowledgeの更新(Archived)・テスト
	 */
    static testMethod void getKnowledgeIsArchivedTest() {
        System.debug('◆◆◆◆getKnowledgeIsArchivedTest:START');
        
        // ユーザ取得
        User user = getUser();
        
        // テスト実施
        System.RunAs(user) {
            
            // カレントページにパラメータを設定
            PageReference pageRef = getPageReference();
            Test.setCurrentPage(pageRef);
            
            // コンストラクタ
            KnowledgeSampleController cls = new KnowledgeSampleController();
            // Knowledgeのデータ作成
            Knowledge__kav knowledge = cls.createKnowledge();
            // Knowledgeのデータ取得
            Knowledge__kav knowledgeDraft = cls.getKnowledgeIsDraft();
            System.assertEquals(knowledgeDraft.PublishStatus, 'Draft');
            // Knowledgeの更新(Online)
            cls.doUpdateKnowledgeOnline(knowledgeDraft);
            // Knowledgeのデータ取得(Online)
            Knowledge__kav knowledgeOnline = cls.getKnowledgeIsOnline();
            System.assertEquals(knowledgeOnline.PublishStatus, 'Online');
            
            // Knowledgeの更新(Archived)
            cls.doUpdateKnowledgeArchived(knowledgeOnline);
            
            // テスト開始
            Test.startTest();
            
            // Knowledgeのデータ取得(Archived)
            Knowledge__kav knowledgeArchived = cls.getKnowledgeIsArchived();
            System.assertEquals(knowledgeArchived.PublishStatus, 'Archived');
            
            // テスト終了
            Test.stopTest();
        }
        
        System.debug('◆◆◆◆getKnowledgeIsArchivedTest:END');
    }
    
    /*
     * ログインユーザの情報取得
     * @param	: なし
     * @return	: ユーザ
     */
    private static User getUser() {
    	return [
    		select
    			Id
    		from
    			User
    		where
    			Id =: UserInfo.getUserId()
    		limit 1
    	];
    }
    
    /*
     * テスト用ページの取得
     * @param	: なし
     * @return	: テスト用ページ
     */
    private static PageReference getPageReference() {
    	return new PageReference('TestPage');
    }
}