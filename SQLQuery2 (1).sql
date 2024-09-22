﻿﻿﻿﻿﻿﻿﻿﻿----------------------------------------------------CREATE-SP----------------------------------------------------
/*==============================================================*/
/* SP: Childs                                                    */
/*==============================================================*/
--DROP Procedure dbo.Get_all_Childs
Create Procedure dbo.Get_all_Childs
AS
Select*from dbo.Childs

--DROP Procedure dbo.SP_get_Child
Create Procedure dbo.SP_get_Child @id varchar(20)
AS
Select*from dbo.Childs where childId = @id

--DROP PROCEDURE dbo.SP_add_Child
CREATE PROCEDURE dbo.SP_add_Child   @id varchar(20), @firstName varchar(20),
									@lastName varchar(20), @group varchar(10),
									@birthDate date, @gender varchar(10),
									@isReward bit, @swaddleAmount integer,
									@clothesAmount integer, @wipesAmount integer,
									@activeStatus BIT

AS
INSERT INTO dbo.Childs
Values (@id, @firstName, @lastName, @group, @birthDate, @gender, @isReward,
		@swaddleAmount, @clothesAmount, @wipesAmount, @activeStatus)

--DROP PROCEDURE dbo.SP_update_child 
CREATE PROCEDURE dbo.SP_update_child @id varchar(20), @firstName varchar(20),
									 @lastName varchar(20), @group varchar(10),
									 @birthDate date, @gender varchar(10),
									 @isReward bit, @swaddleAmount integer,
									 @clothesAmount integer, @wipesAmount integer,
									 @activeStatus bit
AS
Update dbo.Childs
SET
childFirstName = @firstName, childLastName = @lastName, childGroup = @group,
childBirthDate = @birthDate, childGender = @gender, isReward = @isReward,
swaddleAmount  = @swaddleAmount, clothesAmount = @clothesAmount,
wipesAmount = @wipesAmount, activeStatus = @activeStatus

WHERE childId = @id

--DROP PROCEDURE dbo.SP_delete_Child 
CREATE PROCEDURE dbo.SP_delete_Child @id integer
AS
Delete from  dbo.Childs
WHERE childId = @id

/*==============================================================*/
/* SP: Parents                                                   */
/*==============================================================*/
--DROP Procedure dbo.Get_all_Parents
Create Procedure dbo.Get_all_Parents
AS
Select*from dbo.Parents

--DROP PROCEDURE dbo.SP_add_Parent  
CREATE PROCEDURE dbo.SP_add_Parent  @id varchar(20), @firstName varchar(20),
									@lastName varchar(20),  @gender varchar(10),
									@phoneNumber varchar(20), @city varchar	(20),
									@country varchar (20), @street varchar(20),
									@zipCode int
AS
INSERT INTO dbo.Parents
Values (@id, @firstName, @lastName, @gender, @phoneNumber,
		@city, @country, @street, @zipCode)

--DROP PROCEDURE dbo.SP_update_Parent 
CREATE PROCEDURE dbo.SP_update_Parent @id varchar(20), @firstName varchar(20),
									  @lastName varchar(20), @gender varchar(10),
									  @phoneNumber varchar(20), @city varchar	(20),
									  @country varchar (20), @street varchar(20),
									  @zipCode int
AS
Update dbo.Parents
SET
parentFirstName=@firstName, parentLastName = @lastName, parentGender = @gender,
phoneNumber = @phoneNumber, City = @city, Country = @country, Street = @street,
zipCode = @zipCode

WHERE parentId=@id

--DROP PROCEDURE dbo.SP_delete_Parent 
CREATE PROCEDURE dbo.SP_delete_Parent @id integer
AS
Delete from  dbo.Parents
WHERE parentId=@id

/*==============================================================*/
/* SP: Workers                                                   */
/*==============================================================*/

--DROP Procedure dbo.Get_all_Workers
Create Procedure dbo.Get_all_Workers
AS
Select*from dbo.Workers

--DROP Procedure dbo.SP_get_Worker
Create Procedure dbo.SP_get_Worker @id varchar(20)
AS
Select*from dbo.Workers where workerId = @id

--DROP PROCEDURE dbo.SP_add_Worker 
CREATE PROCEDURE dbo.SP_add_Worker  @id varchar(20), @firstName varchar(20),
									@lastName Varchar(10), @title varchar(10),
									@birthDate Datetime, @gender varchar(10),
									@group Varchar(10), @phoneNumber varchar(20), 
									@city varchar(20), @country varchar(20), 
									@street varchar(20), @zipCode Integer, @salary Money, 
									@enterDate Datetime, @activeStatus bit
AS
INSERT INTO dbo.Workers
Values (@id, @firstName, @lastName, @title, @birthDate, @gender, @group, @phoneNumber,
		@city, @country, @street, @zipCode, @salary, @enterDate, @activeStatus)

--DROP PROCEDURE dbo.SP_update_Worker
CREATE PROCEDURE dbo.SP_update_Worker @id varchar(20), @firstName varchar(20),
									  @lastName Varchar(10), @title varchar(10),
									  @birthDate Datetime, @gender varchar(10),
									  @group Varchar(10), @phoneNumber varchar(20), 
									  @city varchar(20), @country varchar(20), 
									  @street varchar(20), @zipCode Integer, @salary Money, 
									  @enterDate Datetime, @activeStatus bit
AS
Update dbo.Workers
SET
workerFirstName=@firstName, workerLastName = @lastName, workerTitle=@title,
workerBirthDate = @birthDate, workerGender = @gender, workerGroup = @group, phoneNumber = @phoneNumber,
City = @city, Country = @country, Street = @street,	zipCode = @zipCode,
Salary = @salary, enterDate = @enterDate, activeStatus = @activeStatus

WHERE workerId=@id

--DROP PROCEDURE dbo.SP_delete_Worker 
CREATE PROCEDURE dbo.SP_delete_Worker @id integer
AS
Delete from  dbo.Workers
WHERE workerId=@id

/*==============================================================*/
/* SP: Products                                                  */
/*==============================================================*/
--DROP Procedure dbo.Get_all_Products
Create Procedure dbo.Get_all_Products
AS
Select*from dbo.Products

--DROP PROCEDURE dbo.SP_add_Product
CREATE PROCEDURE dbo.SP_add_Product @productId varchar(20), @productName varchar(20), @amount Float,
									@thresholdAmount Float, @scale varchar(20), @expDate Datetime
									
AS
INSERT INTO dbo.Products
Values (@productId, @productName, @amount,@thresholdAmount,@scale, @expDate)

--DROP PROCEDURE dbo.SP_view_KitchenStock
CREATE PROCEDURE dbo.SP_view_KitchenStock									
AS
Select		productName as 'שם המוצר', sum(amount) as 'כמות כוללת' ,scale as 'יחידות מידה', avg(thresholdAmount) as 'כמות פג תוקף'
From		Products
GROUP BY	productName, scale

/*==============================================================*/
/* SP: ShiftConstraints                                          */
/*==============================================================*/
--DROP Procedure dbo.Get_all_ShiftConstraints
Create Procedure dbo.Get_all_ShiftConstraints
AS
Select*from dbo.ShiftConstraints

--DROP PROCEDURE dbo.SP_add_ShiftConstraint 
CREATE PROCEDURE dbo.SP_add_ShiftConstraint @workerId varchar(20), @shiftDate datetime, 
									@shiftAvailability BIT, @notes varchar(100)
AS
INSERT INTO dbo.ShiftConstraints
Values (@workerId, @shiftDate, @shiftAvailability, @notes)


/*==============================================================*/
/* SP: Allergies                                                  */
/*==============================================================*/
--DROP Procedure dbo.Get_all_Allergies
Create Procedure dbo.Get_all_Allergies
AS
Select*from dbo.Allergies

--DROP PROCEDURE dbo.SP_add_allergy 
CREATE PROCEDURE dbo.SP_add_allergy @allergyName varchar(20), @allergyDescription varchar(200)
AS
INSERT INTO dbo.Allergies
Values (@allergyName, @allergyDescription)


/*==============================================================*/
/* SP: ChildAllergies                                           */
/*==============================================================*/
--DROP PROCEDURE dbo.SP_add_ChildAllergy 
CREATE PROCEDURE dbo.SP_add_ChildAllergy @childId varchar(20), @allergyName varchar(20)
AS
INSERT INTO dbo.ChildAllergies
Values (@childId, @allergyName)

--DROP PROCEDURE dbo.SP_view_PresentChildAllergies @today datetime
CREATE PROCEDURE dbo.SP_view_PresentChildAllergies @today datetime
AS
SELECT ag.allergyName as AllergyName, count(*) FROM Attendances AS A JOIN Childs AS C ON A.childId = C.childId
																	JOIN ChildAllergies as ca on c.childId = ca.childId
																	JOIN Allergies as ag on ca.allergyName = ag.allergyName
Where A.attendanceDate = @today
group by ag.allergyName

--DROP PROCEDURE dbo.SP_delete_ChildAllergy 
CREATE PROCEDURE dbo.SP_delete_ChildAllergy @ChildId varchar(20) ,@Allergy varchar(20)
AS
Delete from  dbo.ChildAllergies
WHERE childId = @ChildId and allergyName = @Allergy

/*==============================================================*/
/* SP: Attendances                                              */
/*==============================================================*/
--DROP Procedure dbo.Get_all_Attendances
Create Procedure dbo.Get_all_Attendances
AS
Select*from dbo.Attendances

--DROP PROCEDURE dbo.SP_add_Attendance 
CREATE PROCEDURE dbo.SP_add_Attendance @childId varchar(20), @attendanceDate datetime, @isPresent bit, @parentIdPresent varchar(20),
									   @currentArea	Varchar(20), @workerIdArea Varchar(20)
AS
INSERT INTO dbo.Attendances
Values (@childId, @attendanceDate, @isPresent, @parentIdPresent, @currentArea, @workerIdArea)

/*==============================================================*/
/* SP: ChildrenParents                                              */
/*==============================================================*/
--DROP Procedure dbo.Get_all_ChildrenParents
Create Procedure dbo.Get_all_ChildrenParents
AS
Select*from dbo.ChildrenParents

--DROP PROCEDURE dbo.SP_add_ChildrenParent 
CREATE PROCEDURE dbo.SP_add_ChildrenParent @childId varchar(20), @parentId Varchar(20)
AS
INSERT INTO dbo.ChildrenParents
Values (@childId, @parentId)

/*==============================================================*/
/* SP: Show Child's Name                                     */
/*==============================================================*/
--drop procedure dbo.SP_show_Children_Name
CREATE PROCEDURE dbo.SP_show_Children_Name @childGroup varchar(10)
AS
select fullName = childFirstName +''+ childLastName
from dbo.Childs
where dbo.Childs.childGroup =  @childGroup

/*==============================================================*/
/* SP: All Children Attendances In Date                                     */
/*==============================================================*/
--drop procedure dbo.SP_Childs_Attendance_In_Date
CREATE PROCEDURE dbo.SP_Childs_Attendance_In_Date @date Datetime
AS
select	c.childId, c.childFirstName, c.childLastName, c.childGroup,
		c.childBirthDate, c.childGender, c.isReward, c.swaddleAmount,
		c.clothesAmount, c.wipesAmount, c.activeStatus
from Attendances as a join Childs as c on a.childId = c.childId
where a.attendanceDate = @date