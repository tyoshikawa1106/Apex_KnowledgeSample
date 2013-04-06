/*
 * ナレッジ処理のサンプル
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdDate      : 2013/01/01
 * @createdName      : TAIKI,YOSHIKAWA
 * ----------------------------------------
 * @lastModifiedDate : 2013/01/01
 * @lastModifiedName : TAIKI,YOSHIKAWA
 * ----------------------------------------
 */
public with sharing class KnowledgeSampleController {
	
	/*
	 * コンストラクタ
	 */
	public KnowledgeSampleController() {
		
	}
	
	/*
	 * Knowledgeのデータ作成
	 * @param	: なし
	 * @return	: Knowledge
	 */
	public Knowledge__kav createKnowledge() {
		System.debug('◆◆◆◆createKnowledge:START');
		
		Knowledge__kav knowledge = new Knowledge__kav(
			 UrlName = 'UrlName'
			,Title = 'Title'
			,Summary = 'Summary'
			,Language = 'ja'
		);
		
		insert knowledge;
		
		System.debug('◆◆◆◆createKnowledge:END');
		return null;
	}
	
	/*
	 * Knowledgeの情報取得(Draft)
	 * @param	: なし
	 * @return	: Knowledge
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
	
	/*
	 * Knowledgeの更新(Online)
	 * @param	: ナレッジ		[prmKnowledge]
	 * @return	: なし
	 */
	public void doUpdateKnowledgeOnline(Knowledge__kav prmKnowledge) {
		System.debug('◆◆◆◆doUpdateKnowledgeOnline:START');
		
		String articleId = prmKnowledge.KnowledgeArticleId;
		KbManagement.PublishingService.publishArticle(articleId, true);
		
		System.debug('◆◆◆◆doUpdateKnowledgeOnline:END');
	}
	
	/*
	 * Knowledgeの情報取得(Online)
	 * @param	: なし
	 * @return	: Knowledge
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
	
	/*
	 * Knowledgeの更新(Archived)
	 * @param	: ナレッジ		[prmKnowledge]
	 * @return	: なし
	 */
	public void doUpdateKnowledgeArchived(Knowledge__kav prmKnowledge) {
		System.debug('◆◆◆◆doUpdateKnowledgeArchived:START');
		
		String articleId = prmKnowledge.KnowledgeArticleId;
		KbManagement.PublishingService.archiveOnlineArticle(articleId, null);
		
		System.debug('◆◆◆◆doUpdateKnowledgeArchived:END');
	}
	
	/*
	 * Knowledgeの情報取得(Archived)
	 * @param	: なし
	 * @return	: Knowledge
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