/**
 * ナレッジ処理のサンプル
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class KnowledgeSampleControllerTest {

    /**
     * コンストラクタ
     */
    static testMethod void KnowledgeSampleControllerTest() {
            
        Test.startTest();
        
        // コンストラクタ
        KnowledgeSampleController cls = new KnowledgeSampleController();
        
        Test.stopTest();
    }
    
    /**
     * Knowledgeのデータ作成
     */
    static testMethod void createKnowledgeTest() {
            
        // コンストラクタ
        KnowledgeSampleController cls = new KnowledgeSampleController();
        
        Test.startTest();
        
        // Knowledgeのデータ作成
        Knowledge__kav knowledge = cls.createKnowledge();
        System.assertNotEquals(knowledge, new Knowledge__kav());
        
        Test.stopTest();
    }
    
    /**
     * Knowledgeの情報取得
     */
    static testMethod void getKnowledgeTest() {
            
        // コンストラクタ
        KnowledgeSampleController cls = new KnowledgeSampleController();
        // Knowledgeのデータ作成
        Knowledge__kav knowledge = cls.createKnowledge();
        
        Test.startTest();
        
        // Knowledgeのデータ取得
        Knowledge__kav knowledgeDraft = cls.getKnowledgeIsDraft();
        System.assertEquals(knowledgeDraft.PublishStatus, 'Draft');
        
        Test.stopTest();
    }
    
    /**
     * Knowledgeの更新(Online)
     */
    static testMethod void doUpdateKnowledgeOnlineTest() {
            
        // コンストラクタ
        KnowledgeSampleController cls = new KnowledgeSampleController();
        // Knowledgeのデータ作成
        Knowledge__kav knowledge = cls.createKnowledge();
        // Knowledgeのデータ取得
        Knowledge__kav knowledgeDraft = cls.getKnowledgeIsDraft();
        System.assertEquals(knowledgeDraft.PublishStatus, 'Draft');
        
        Test.startTest();
        
        // Knowledgeの更新(Online)
        cls.doUpdateKnowledgeOnline(knowledgeDraft);
        
        Test.stopTest();
    }
    
    /**
     * Knowledgeの取得(Online)
     */
    static testMethod void getKnowledgeIsOnlineTest() {
            
        // コンストラクタ
        KnowledgeSampleController cls = new KnowledgeSampleController();
        // Knowledgeのデータ作成
        Knowledge__kav knowledge = cls.createKnowledge();
        // Knowledgeのデータ取得(Draft)
        Knowledge__kav knowledgeDraft = cls.getKnowledgeIsDraft();
        System.assertEquals(knowledgeDraft.PublishStatus, 'Draft');
        // Knowledgeの更新(Online)
        cls.doUpdateKnowledgeOnline(knowledgeDraft);
        
        Test.startTest();
        
        // Knowledgeのデータ取得(Online)
        Knowledge__kav knowledgeOnline = cls.getKnowledgeIsOnline();
        System.assertEquals(knowledgeOnline.PublishStatus, 'Online');
        
        Test.stopTest();
    }
    
    /**
     * Knowledgeの更新(Archived)
     */
    static testMethod void doUpdateKnowledgeArchivedTest() {
            
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
        
        Test.startTest();
        
        // Knowledgeの更新(Archived)
        cls.doUpdateKnowledgeArchived(knowledgeOnline);
        
        Test.stopTest();
    }
    
    /**
     * Knowledgeの更新(Archived)
     */
    static testMethod void getKnowledgeIsArchivedTest() {
            
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
        
        Test.startTest();
        
        // Knowledgeのデータ取得(Archived)
        Knowledge__kav knowledgeArchived = cls.getKnowledgeIsArchived();
        System.assertEquals(knowledgeArchived.PublishStatus, 'Archived');
        
        Test.stopTest();
    }
}