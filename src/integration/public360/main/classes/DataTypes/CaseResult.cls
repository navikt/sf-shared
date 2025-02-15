public class CaseResult implements IJsonSerializable {
    public Integer Recno;
    public String CaseNumber;
    public ExternalIdParameter ExternalId;
    public String Title;
    public Datetime CaseDate; // Date
    public String Status;
    public String AccessCodeDescription;
    public String AccessCodeCode;
    public String AccessGroup;
    public String Paragraph;
    //ResponsibleEnterprise	{...}
    public String ResponsibleEnterpriseName;
    //ResponsiblePerson	{...}
    public String ResponsiblePersonName;
    public List<ArchiveCodeParameter> ArchiveCodes;
    //Documents	{...}
    //ReferringCases	{...}
    //ReferringDocuments	{...}
    public String UnofficialTitle;
    public Datetime CreatedDate;
    public String Notes;
    public String CaseTypeCode;
    public String CaseTypeDescription;
    public List<ContactParameter> Contacts;
    public String ProjectRecno;
    public String ProjectName;
    public String SubArchive;
    public String SubArchiveCode;
    public List<EstateParameter> CaseEstates;
    public String CaseRowPermissions;
    //CustomFields	{...}
    public Datetime LastChangedDate;
    //ProgressPlan	{...}
    public String SubjectSpecificMetaData;
    public String SubjectSpecificMetaDataNamespace;
    public String URL;
    public String AccessGroupRecno;
    public String eArchiveXMLFragment;
    public String ImportedCaseNumber;
    public List<RemarkParameter> Remarks;
    public List<String> Keywords;
    //Milestones	{...}
    public String UID;
    public String UIDOrigin;
    //Stages	{...}
    public String StatusRecno;

    public String toJson() {
        //this.validate(); // Ensure mandatory fields are present before serialization
        JsonHelper jsonHelper = new JsonHelper();
        jsonHelper.writeStartObject();

        jsonHelper.writeEndObject();

        return jsonHelper.getAsString();
    }

    public static CaseResult fromJson(String jsonString) {
        Map<String, Object> rawMap = (Map<String, Object>) JSON.deserializeUntyped(
            jsonString
        );

        CaseResult instance = new CaseResult();
        instance.Recno = (Integer) rawMap.get('Recno');
        instance.CaseNumber = (String) rawMap.get('CaseNumber');
        instance.ExternalId = ExternalIdParameter.fromMap(
            (Map<String, Object>) rawMap.get('ExternalId')
        );
        instance.Title = (String) rawMap.get('Title');
        instance.CaseDate = Datetime.now(); //TODO: Implement -->//(Datetime) rawMap.get('CaseDate');
        instance.Status = (String) rawMap.get('Status');
        instance.AccessCodeDescription = (String) rawMap.get(
            'AccessCodeDescription'
        );
        instance.AccessCodeCode = (String) rawMap.get('AccessCodeCode');
        instance.AccessGroup = (String) rawMap.get('AccessGroup');
        instance.Paragraph = (String) rawMap.get('Paragraph');
        instance.ResponsibleEnterpriseName = (String) rawMap.get(
            'ResponsibleEnterpriseName'
        );
        instance.ResponsiblePersonName = (String) rawMap.get(
            'ResponsiblePersonName'
        );
        instance.ArchiveCodes = new List<ArchiveCodeParameter>();
        List<Object> rawArchiveCodes = (List<Object>) rawMap.get(
            'ArchiveCodes'
        );
        for (Object rawArchiveCode : rawArchiveCodes) {
            instance.ArchiveCodes.add(
                ArchiveCodeParameter.fromMap(
                    (Map<String, Object>) rawArchiveCode
                )
            );
        }
        instance.UnofficialTitle = (String) rawMap.get('UnofficialTitle');
        instance.CreatedDate = Datetime.now(); //TODO: Implement -->//(Datetime) rawMap.get('CreatedDate');
        instance.Notes = (String) rawMap.get('Notes');
        instance.CaseTypeCode = (String) rawMap.get('CaseTypeCode');
        instance.CaseTypeDescription = (String) rawMap.get(
            'CaseTypeDescription'
        );
        instance.Contacts = new List<ContactParameter>();
        List<Object> rawContacts = (List<Object>) rawMap.get('Contacts');
        for (Object rawContact : rawContacts) {
            instance.Contacts.add(
                ContactParameter.fromMap((Map<String, Object>) rawContact)
            );
        }
        instance.ProjectRecno = (String) rawMap.get('ProjectRecno');
        instance.ProjectName = (String) rawMap.get('ProjectName');
        instance.SubArchive = (String) rawMap.get('SubArchive');
        instance.SubArchiveCode = (String) rawMap.get('SubArchiveCode');
        instance.CaseEstates = new List<EstateParameter>();
        List<Object> rawCaseEstates = (List<Object>) rawMap.get('CaseEstates');
        for (Object rawCaseEstate : rawCaseEstates) {
            instance.CaseEstates.add(
                EstateParameter.fromMap((Map<String, Object>) rawCaseEstate)
            );
        }
        instance.CaseRowPermissions = (String) rawMap.get('CaseRowPermissions');
        instance.LastChangedDate = Datetime.now(); //TODO: Implement -->//(Datetime) rawMap.get('LastChangedDate');
        instance.SubjectSpecificMetaData = (String) rawMap.get(
            'SubjectSpecificMetaData'
        );
        instance.SubjectSpecificMetaDataNamespace = (String) rawMap.get(
            'SubjectSpecificMetaDataNamespace'
        );
        instance.URL = (String) rawMap.get('URL');
        instance.AccessGroupRecno = (String) rawMap.get('AccessGroupRecno');
        instance.eArchiveXMLFragment = (String) rawMap.get(
            'eArchiveXMLFragment'
        );
        instance.ImportedCaseNumber = (String) rawMap.get('ImportedCaseNumber');
        instance.Remarks = new List<RemarkParameter>();
        List<Object> rawRemarks = (List<Object>) rawMap.get('Remarks');
        for (Object rawRemark : rawRemarks) {
            instance.Remarks.add(
                RemarkParameter.fromMap((Map<String, Object>) rawRemark)
            );
        }
        instance.Keywords = new List<String>();
        List<Object> rawKeywords = (List<Object>) rawMap.get('Keywords');
        for (Object rawKeyword : rawKeywords) {
            instance.Keywords.add((String) rawKeyword);
        }
        instance.UID = (String) rawMap.get('UID');
        instance.UIDOrigin = (String) rawMap.get('UIDOrigin');
        instance.StatusRecno = (String) rawMap.get('StatusRecno');

        return instance;
    }

    public static CaseResult fromMap(Map<String, Object> mapData) {
        CaseResult caseResult = new CaseResult();
        caseResult.Recno = (Integer) mapData.get('Recno');
        caseResult.CaseNumber = (String) mapData.get('CaseNumber');
        caseResult.ExternalId = ExternalIdParameter.fromMap(
            (Map<String, Object>) mapData.get('ExternalId')
        );
        caseResult.Title = (String) mapData.get('Title');
        caseResult.CaseDate = Datetime.now(); //TODO: Implement -->//(Datetime) mapData.get('CaseDate');
        caseResult.Status = (String) mapData.get('Status');
        caseResult.AccessCodeDescription = (String) mapData.get(
            'AccessCodeDescription'
        );
        caseResult.AccessCodeCode = (String) mapData.get('AccessCodeCode');
        caseResult.AccessGroup = (String) mapData.get('AccessGroup');
        caseResult.Paragraph = (String) mapData.get('Paragraph');
        caseResult.ResponsibleEnterpriseName = (String) mapData.get(
            'ResponsibleEnterpriseName'
        );
        caseResult.ResponsiblePersonName = (String) mapData.get(
            'ResponsiblePersonName'
        );
        caseResult.ArchiveCodes = new List<ArchiveCodeParameter>();
        List<Object> rawArchiveCodes = (List<Object>) mapData.get(
            'ArchiveCodes'
        );
        for (Object rawArchiveCode : rawArchiveCodes) {
            caseResult.ArchiveCodes.add(
                ArchiveCodeParameter.fromMap(
                    (Map<String, Object>) rawArchiveCode
                )
            );
        }
        caseResult.UnofficialTitle = (String) mapData.get('UnofficialTitle');
        caseResult.CreatedDate = Datetime.now(); //TODO: Implement -->//(Datetime) mapData.get('CreatedDate');
        caseResult.Notes = (String) mapData.get('Notes');
        caseResult.CaseTypeCode = (String) mapData.get('CaseTypeCode');
        caseResult.CaseTypeDescription = (String) mapData.get(
            'CaseTypeDescription'
        );
        caseResult.Contacts = new List<ContactParameter>();
        List<Object> rawContacts = (List<Object>) mapData.get('Contacts');
        for (Object rawContact : rawContacts) {
            caseResult.Contacts.add(
                ContactParameter.fromMap((Map<String, Object>) rawContact)
            );
        }
        caseResult.ProjectRecno = (String) mapData.get('ProjectRecno');
        caseResult.ProjectName = (String) mapData.get('ProjectName');
        caseResult.SubArchive = (String) mapData.get('SubArchive');
        caseResult.SubArchiveCode = (String) mapData.get('SubArchiveCode');
        caseResult.CaseEstates = new List<EstateParameter>();
        List<Object> rawCaseEstates = (List<Object>) mapData.get('CaseEstates');
        for (Object rawCaseEstate : rawCaseEstates) {
            caseResult.CaseEstates.add(
                EstateParameter.fromMap((Map<String, Object>) rawCaseEstate)
            );
        }
        caseResult.CaseRowPermissions = (String) mapData.get(
            'CaseRowPermissions'
        );
        caseResult.LastChangedDate = Datetime.now(); //TODO: Implement -->//(Datetime) mapData.get('LastChangedDate');
        caseResult.SubjectSpecificMetaData = (String) mapData.get(
            'SubjectSpecificMetaData'
        );
        caseResult.SubjectSpecificMetaDataNamespace = (String) mapData.get(
            'SubjectSpecificMetaDataNamespace'
        );
        caseResult.URL = (String) mapData.get('URL');
        caseResult.AccessGroupRecno = (String) mapData.get('AccessGroupRecno');
        caseResult.eArchiveXMLFragment = (String) mapData.get(
            'eArchiveXMLFragment'
        );
        caseResult.ImportedCaseNumber = (String) mapData.get(
            'ImportedCaseNumber'
        );
        caseResult.Remarks = new List<RemarkParameter>();
        List<Object> rawRemarks = (List<Object>) mapData.get('Remarks');
        for (Object rawRemark : rawRemarks) {
            caseResult.Remarks.add(
                RemarkParameter.fromMap((Map<String, Object>) rawRemark)
            );
        }
        caseResult.Keywords = new List<String>();
        List<Object> rawKeywords = (List<Object>) mapData.get('Keywords');
        for (Object rawKeyword : rawKeywords) {
            caseResult.Keywords.add((String) rawKeyword);
        }
        caseResult.UID = (String) mapData.get('UID');
        caseResult.UIDOrigin = (String) mapData.get('UIDOrigin');
        caseResult.StatusRecno = (String) mapData.get('StatusRecno');

        return caseResult;
    }
}
