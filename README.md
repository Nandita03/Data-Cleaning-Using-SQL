# Data-Cleaning-Using-SQL
This project targets to demonstrate how to do data cleaning using SQL which includes removing irrelevant or duplicate data, handle missing data, fix structural errors etc.
Dataset used in this project can be downloaded from [here](https://github.com/AlexTheAnalyst/PortfolioProjects/blob/main/Nashville%20Housing%20Data%20for%20Data%20Cleaning.xlsx) 
## Displaying Data that's going to be used for analysis
 
![image](https://user-images.githubusercontent.com/22257555/223179426-4915c48f-e2d3-414b-954a-1b388acffd14.png)

![image](https://user-images.githubusercontent.com/22257555/223165019-e8512d1d-b829-4351-85ae-3ec55b8c4bb1.png)

## Standardizing Date Format

We want Sale date format as yyyy/mm/dd. But right now it is in the format shown below:

![image](https://user-images.githubusercontent.com/22257555/223167658-b5789d85-fa4b-4cd0-b852-c273954f0cfd.png)

### To standardize date format:

![image](https://user-images.githubusercontent.com/22257555/223179665-48d5a24a-b391-46c2-9054-00d29bea63f0.png)

![image](https://user-images.githubusercontent.com/22257555/223170193-0d6232d2-f494-444f-9823-0c644e1a2b47.png)

## Populating PropertyAddress Data

As we can see some of PropertyAddresses are null 

![image](https://user-images.githubusercontent.com/22257555/223173148-c445ee4e-a5c8-401e-942a-8ef8970e0eee.png)

To avoid null values we will be populating the propertyaddress field by applying self join on the table where the parcelID will be same but Unique ID will be different.

![image](https://user-images.githubusercontent.com/22257555/223174404-b6d86388-220a-43e4-b759-2ef5c931eef9.png)

![image](https://user-images.githubusercontent.com/22257555/223174590-58ec4511-8eb6-4f61-9706-335e8b5f58a7.png)
Note: To check there are no remanining null valyes in PropertyAddress field we can uncomment the last line.

## Breaking out Address into Individual Columns (Address, City, State)

As it can be seen in PropertyAddress field we have Address and City in the same column

![image](https://user-images.githubusercontent.com/22257555/223175509-cf64b3ee-5fb5-434a-a57e-f9e0c50ad4a8.png)

![image](https://user-images.githubusercontent.com/22257555/223175558-784bae72-4376-41f1-85a6-2b7bcba8b00d.png)

Adding Two new columns for Address and City

![image](https://user-images.githubusercontent.com/22257555/223176047-8d271fd0-8745-493f-89c0-a425db12d16f.png)

### Updating the columns with Address and city seperately

![image](https://user-images.githubusercontent.com/22257555/223176745-a3f3d276-f435-4c50-890b-e7aef03fc1af.png)

![image](https://user-images.githubusercontent.com/22257555/223176924-c59d6e63-f7a3-4353-a607-8b2da87e2878.png)

![image](https://user-images.githubusercontent.com/22257555/223176993-be5f0743-4cf6-4aec-92d7-c8a6b8e6dfed.png)

As it can be seen in OwnerAddress field as well we have Address, City and State in the same column

![image](https://user-images.githubusercontent.com/22257555/223177320-53d4beb3-da43-4de4-9e02-f82d66d49524.png)

![image](https://user-images.githubusercontent.com/22257555/223177394-5bfc64f9-01d8-444b-bfc4-5efd534a11b6.png)

Adding Three new columns for Address, City and State

![image](https://user-images.githubusercontent.com/22257555/223177739-cbfda82e-8494-441a-a62f-b3c4d65c894d.png)

### Updating the columns with Address, City and State seperately

![image](https://user-images.githubusercontent.com/22257555/223178034-4af6b5ba-f4b1-458b-a9d3-bf042651e253.png)

![image](https://user-images.githubusercontent.com/22257555/223178264-739730ad-ef1e-4cf1-a756-ed064d372d29.png)

![image](https://user-images.githubusercontent.com/22257555/223178327-b59d90d1-9cb0-46ca-975e-39821a458336.png)

## Changing Y and N to Yes and No in "Sold as Vacant" field

Right now "Sold as Vacant" field has 4 variables

![image](https://user-images.githubusercontent.com/22257555/223178755-43ca7ad1-d65f-4ca7-9a24-062e19814283.png)

![image](https://user-images.githubusercontent.com/22257555/223178863-23147898-1491-454e-aeab-dce1f641e893.png)

We will be changing Y and N to Yes and No

![image](https://user-images.githubusercontent.com/22257555/223179029-acf4bbb1-1fbb-482e-b2b2-b9a1a2837135.png)

![image](https://user-images.githubusercontent.com/22257555/223179105-a4caf6d9-801e-4471-92e4-3df2ceb2e2be.png)

## Removing Duplicates Using CTE

![image](https://user-images.githubusercontent.com/22257555/223180932-0731e5b7-e169-4a3b-8197-7845a40c3362.png)

## Deleting Unused Columns

![image](https://user-images.githubusercontent.com/22257555/223181301-965a1a3b-9dce-49ee-8a9c-f8bfcfe9dc41.png)






