//Source Code for KeyPrefix Provided by Ankit Arora
//http://forceguru.blogspot.com/2011/12/fetching-sobject-type-from-record-id.html
public class KeyPrefix
{
    // map to hold global describe data
    private static Map<String,Schema.SObjectType> gd;
    
    // map to store objects and their prefixes
    private static Map<String, Schema.SObjectType> keyPrefixMap;

    // to hold set of all sObject prefixes
    private static Set<String> keyPrefixSet;
    
    private static void init() {
        // get all objects from the org
        gd = Schema.getGlobalDescribe();
        
        // to store objects and their prefixes
        keyPrefixMap = new Map<String, Schema.SObjectType>{};
        
        //get the object prefix in IDs
        keyPrefixSet = gd.keySet();
        
        // fill up the prefixes map
        for(String sObj : keyPrefixSet)
        {
            Schema.DescribeSObjectResult r =  gd.get(sObj).getDescribe();
            String tempName = r.getName();
            String tempPrefix = r.getKeyPrefix();
            keyPrefixMap.put(tempPrefix, r.getSObjectType());
        }
    }
    
    public static Schema.SObjectType GetKeyPrefix(String ObjId)
    {
        init() ;
        String tPrefix = ObjId;
        tPrefix = tPrefix.subString(0,3);
        
        //get the object type now
        Schema.SObjectType objectType = keyPrefixMap.get(tPrefix);
        return objectType;
    }
}