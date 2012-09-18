public with sharing class SOQLHelper 
{
	public static List<Schema.FieldSetMember> getFieldSet(String objId)
	{
		Schema.SObjectType objType = KeyPrefix.GetKeyPrefix(objId);
		Map<String, Schema.FieldSet> fieldSetMap = objType.getDescribe().fieldSets.getMap();
		
		return  fieldSetMap.get('genericDataView').getFields();
	}
	
	public static list<Sobject> executeDynamicSOQLViaFieldSet(String objId)
	{
		List<SObject>results = new List<SObject>();
		Schema.SObjectType objType = KeyPrefix.GetKeyPrefix(objId);
		Map<String, Schema.FieldSet> fieldSetMap = objType.getDescribe().fieldSets.getMap();
		
		Schema.FieldSet genericFieldSet = fieldSetMap.get('genericDataView');
		
		if(genericFieldSet != null)
		{
			String query = 'SELECT ';
			List<Schema.FieldSetMember> fieldMembers = genericFieldSet.getFields();
			for(Schema.FieldSetMember fm : fieldMembers)
			{
				query += fm.getFieldPath() + ',';
			}
			query = query.subString(0,query.length() - 1);
			query += ' FROM ' + objType.getDescribe().getName() + ' WHERE id = \'' + objID + '\'';
			results = Database.query(query);
		}
		return results;
	}
	
}