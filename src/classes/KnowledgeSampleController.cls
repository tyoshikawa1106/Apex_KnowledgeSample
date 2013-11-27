/**
 * ナレッジ処理のサンプル
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class KnowledgeSampleController {
    
    /**
     * コンストラクタ
     */
    public KnowledgeSampleController() {
        
    }
    
    /**
     * Knowledgeのデータ作成
     * @param   : none
     * @return  : Knowledge
     */
    public Knowledge__kav createKnowledge() {
        System.debug('createKnowledge:START');
        
        Knowledge__kav knowledge = new Knowledge__kav(
             UrlName = 'UrlName'
            ,Title = 'Title'
            ,Summary = 'Summary'
            ,Language = 'ja'
        );
        
        insert knowledge;
        
        System.debug('createKnowledge:END');
        return null;
    }
    
    /**
     * Knowledgeの情報取得(Draft)
     * @param   : none
     * @return  : Knowledge
     */
    public Knowledge__kav getKnowledgeIsDraft() {
        return [
            select
                 Id
                ,UrlName
                ,Title
                ,Summary
                ,PublishStatus
                ,KnowledgeArticleId
            from
                Knowledge__kav
            where
                PublishStatus = 'Draft'
            and
                Language = 'ja'
            and
                UrlName =: 'UrlName'
            limit 1
        ];
    }
    
    /**
     * Knowledgeの更新(Online)
     * @param   : ナレッジ      [prmKnowledge]
     * @return  : none
     */
    public void doUpdateKnowledgeOnline(Knowledge__kav prmKnowledge) {
        System.debug('doUpdateKnowledgeOnline:START');
        
        String articleId = prmKnowledge.KnowledgeArticleId;
        KbManagement.PublishingService.publishArticle(articleId, true);
        
        System.debug('doUpdateKnowledgeOnline:END');
    }
    
    /**
     * Knowledgeの情報取得(Online)
     * @param   : none
     * @return  : Knowledge
     */
    public Knowledge__kav getKnowledgeIsOnline() {
        return [
            select
                 Id
                ,UrlName
                ,Title
                ,Summary
                ,PublishStatus
                ,KnowledgeArticleId
            from
                Knowledge__kav
            where
                PublishStatus = 'Online'
            and
                Language = 'ja'
            and
                UrlName =: 'UrlName'
            limit 1
        ];
    }
    
    /**
     * Knowledgeの更新(Archived)
     * @param   : ナレッジ      [prmKnowledge]
     * @return  : none
     */
    public void doUpdateKnowledgeArchived(Knowledge__kav prmKnowledge) {
        System.debug('doUpdateKnowledgeArchived:START');
        
        String articleId = prmKnowledge.KnowledgeArticleId;
        KbManagement.PublishingService.archiveOnlineArticle(articleId, null);
        
        System.debug('doUpdateKnowledgeArchived:END');
    }
    
    /**
     * Knowledgeの情報取得(Archived)
     * @param   : none
     * @return  : Knowledge
     */
    public Knowledge__kav getKnowledgeIsArchived() {
        return [
            select
                 Id
                ,UrlName
                ,Title
                ,Summary
                ,PublishStatus
                ,KnowledgeArticleId
            from
                Knowledge__kav
            where
                PublishStatus = 'Archived'
            and
                Language = 'ja'
            and
                UrlName =: 'UrlName'
            limit 1
        ];
    }
}