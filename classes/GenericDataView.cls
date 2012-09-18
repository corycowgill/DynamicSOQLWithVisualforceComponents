public with sharing class GenericDataView 
{
	public String objectId {get;set;}
	public SOBject objectData;
	public List<Schema.FieldSetMember> fieldSet;
	
	public void setFieldSet(List<Schema.FieldSetMember> flds)
	{
		fieldSet = flds;
	}
	
	public List<Schema.FieldSetMember> getFieldSet()
	{
		return SOQLHelper.getFieldSet(objectId);
	}
	
	public SObject getObjectData()
	{
		return SOQLHelper.executeDynamicSOQLViaFieldSet(objectId).get(0);
	}
	
	public GenericDataView()
	{
		
	}
}