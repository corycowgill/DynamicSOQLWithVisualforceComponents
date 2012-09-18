public class AccountRelatedListExtension 
{
	public List<Contact> cons {get;set;}
	
	public AccountRelatedListExtension(ApexPages.standardController std)
	{
		String acctId = std.getId();
		cons = [Select Id from Contact where AccountId =: acctId];
	}
}