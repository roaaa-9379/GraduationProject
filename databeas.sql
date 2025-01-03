

create database ElevtionStudent;

-- إنشاء جدول Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX),
    UniversityNumber INT NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    College NVARCHAR(100)
);

-- إنشاء جدول Elections
CREATE TABLE Elections (
    ElectionID INT PRIMARY KEY IDENTITY,
    StudentID INT NULL,
    CampaignDescription NVARCHAR(MAX),
    Contributions NVARCHAR(MAX),
    College NVARCHAR(100),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE SET NULL
);

-- إنشاء جدول VolunteerCampaigns
CREATE TABLE VolunteerCampaigns (
    CampaignID INT PRIMARY KEY IDENTITY,
    CampaignName NVARCHAR(100),
);
 
 ALTER TABLE VolunteerCampaigns
DROP COLUMN CampaignDescription;



-- إضافة عمود لتاريخ الحملة
ALTER TABLE VolunteerCampaigns
ADD CampaignDate DATE  DEFAULT GETDATE();

-- إضافة عمود لتحديد حالة الحملة (تم نشرها أو لا)
ALTER TABLE VolunteerCampaigns
ADD IsPublished BIT  DEFAULT 0;

-- إضافة عمود المسؤول عن الحملة
ALTER TABLE VolunteerCampaigns
ADD ResponsiblePerson NVARCHAR(100);

-- إضافة عمود مكان الحملة
ALTER TABLE VolunteerCampaigns
ADD Location NVARCHAR(200) ;


ALTER TABLE VolunteerCampaigns
ADD CampaignDescription NVARCHAR(MAX);









-- إنشاء جدول VolunteerApplications
CREATE TABLE VolunteerApplications (
    ApplicationID INT PRIMARY KEY IDENTITY,
    StudentID INT NULL,
    CampaignID INT NULL,
    ApplicationDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE SET NULL,
    FOREIGN KEY (CampaignID) REFERENCES VolunteerCampaigns(CampaignID) ON DELETE SET NULL
);

-- إنشاء جدول Votes
CREATE TABLE Votes (
    VoteID INT PRIMARY KEY IDENTITY,
    ElectionID INT NULL,
    StudentID INT NULL,
    VoteCount INT DEFAULT 0,
    FOREIGN KEY (ElectionID) REFERENCES Elections(ElectionID) ON DELETE CASCADE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE SET NULL
);
