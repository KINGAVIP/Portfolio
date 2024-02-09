// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;

contract Portfolio{
    struct Education{
        uint edId;
        string Degree;
        string Course;
        string InstitutionName;
        string date;
    }

    struct Project{
        uint id;
        string PNAme;
        string PDesc;
        string image;
        string Plink;
    }

    string  public profiledp="QmXUPdY3BVTfudEXTsRrsGQbjQAYTJNnYg9jhR53uLoQvr";
    string public  resume="QmXV8Y73BRQ6xLVymUuDRproDQh3BECJDgws2qCEz42VCp";
    string public description="";
    Project[3] public projects;
    Education[3] public education;

    uint24 projectCount=0;
    uint24 EducationCount=0;

    address public manager;
    constructor() {
        manager=msg.sender;
    }

    modifier onlyManager(){
        require(manager==msg.sender,"YOu are not the manager");
        _;
    }
    function insertProject(string calldata _name,string calldata _desc,string calldata _plink,string calldata _image) external
    {
        require(projectCount<3,"Projects to be less than 3");
        projects[projectCount]=Project(projectCount,_name,_desc,_plink,_image);
        projectCount++;
    }        

    function changeProject(string calldata _name,string calldata _desc,string calldata _plink,string calldata _image,uint _projectCount) external
    {
        require(_projectCount>=0 && _projectCount<3,"Invalid project");
        projects[_projectCount]=Project(_projectCount,_name,_desc,_plink,_image);
    }

    function allProjects() view public  returns(Project[3] memory){
        return projects;
    }

    function insertEducation(string calldata _Degree,string calldata _Course,string
        calldata _Institution, string calldata _date
    ) external 
    {
        require(EducationCount<3,"Exceeds number of education");
        education[EducationCount]=Education(EducationCount,_Degree,_Course,_Institution,_date);
        EducationCount++;
    }

    function changeEducation(uint24 _edId,string calldata _Degree,string calldata _Course,string
        calldata _Institution, string calldata _date
    ) external {
        require(_edId>=0 && _edId<3,"Invalid id");
        education[EducationCount]=Education(_edId,_Degree,_Course,_Institution,_date);        
    }

    function allEducation() view public returns(Education[3] memory){
        return education;
    }
}