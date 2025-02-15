public class UpdateCaseParameter implements IJsonSerializable {
    public String CaseNumber;
    public Boolean SyncCaseContacts;
    public Boolean RemoveResponsiblePerson;
    public Boolean SyncCaseEstates;
    public String ADContextUser;
    public ExternalIdParameter ExternalId;
    public String Title;
    public String UnofficialTitle;
    public String Status;
    public Datetime StartDate;
    public String JournalUnit;
    public String SubArchive;
    public List<ArchiveCodeParameter> ArchiveCodes;
    public Boolean FiledOnPaper;
    public List<String> Keywords;
    public String AccessCode;
    public String Paragraph;
    public String AccessGroup;
    public String Notes;
    public String ResponsibleEnterpriseRecno;
    public String ResponsibleEnterpriseNumber;
    public String ResponsiblePersonIdNumber;
    public String ResponsiblePersonRecno;
    public String ResponsiblePersonEmail;
    public String ResponsiblePersonUserId;
    public List<RemarkParameter> Remarks;
    public List<ContactParameter> Contacts;
    public List<UnregisteredContactsParameter> UnregisteredContacts;
    public String Project;
    public String ScrapCode;
    public List<String> ReferringCases;
    public String Category;
    public List<EstateParameter> Estates;
    //public List<AdditionalFieldParameter> AdditionalFields;
    public String ProgressPlanId;
    //public List<PermissionParameter> Permissions;
    //public List<AdditionalListFieldParameter> AdditionalListFields;
    public String eArchiveXMLFragment;
    public String ImportedCaseNumber;

    public String toJson() {
        //this.validate(); // Ensure mandatory fields are present before serialization
        JsonHelper jsonHelper = new JsonHelper();
        jsonHelper.writeStartObject();

        jsonHelper.writeEndObject();

        return jsonHelper.getAsString();
    }
}
