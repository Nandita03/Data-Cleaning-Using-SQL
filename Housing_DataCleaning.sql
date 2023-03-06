--Cleaning Data in SQL Queries

Select * 
from SqlTutorial.dbo.Housing

-- Standardize date format 

ALTER TABLE Housing
Add SaleDateConverted Date;

Update Housing
SET SaleDateConverted = CONVERT(Date,SaleDate)

Select SaleDateConverted
from SqlTutorial.dbo.Housing

--Populate property address data

Select *
from SqlTutorial.dbo.Housing
where PropertyAddress is null
order by ParcelID


Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
from SqlTutorial.dbo.Housing a
JOIN SqlTutorial.dbo.Housing b
     on a.ParcelID = b.ParcelID
	 AND a.[UniqueID ] <> b.[UniqueID ]
--where a.PropertyAddress is null

Update a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
from SqlTutorial.dbo.Housing a
JOIN SqlTutorial.dbo.Housing b
     on a.ParcelID = b.ParcelID
	 AND a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

-- Breaking out Address into Individual COlumns(Address, City, State)

Select PropertyAddress
from SqlTutorial.dbo.Housing

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) as Address
,SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1,LEN(PropertyAddress)) as Address

from SqlTutorial.dbo.Housing

ALTER TABLE Housing
Add PropertySplitAddress Nvarchar(255),
    PropertySplitCity Nvarchar(255);

Update Housing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1),
    PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1,LEN(PropertyAddress)) 


Select PropertyAddress, PropertySplitAddress, PropertySplitCity 
from SqlTutorial.dbo.Housing

ALTER TABLE Housing
Add OwnerSplitAddress Nvarchar(255),
    OwnerSplitCity Nvarchar(255),
	OwnerSplitState Nvarchar(255);

Update Housing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',','.'),3),
    OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',','.'),2),
	OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',','.'),1)

Select OwnerAddress, OwnerSplitAddress, OwnerSplitCity, OwnerSplitState
from SqlTutorial.dbo.Housing

-- Change Y and N to Yes and NO in "Sold as Vacant" field

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
from SqlTutorial.dbo.Housing
Group by SoldAsVacant
Order by 2

Update Housing
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
       When SoldAsVacant = 'N' THEN 'No'
	   Else SoldAsVacant
	   END
from SqlTutorial.dbo.Housing


-- Remove Duplicates

WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) row_num

From SqlTutorial.dbo.Housing
--order by ParcelID
)

Select *
From RowNumCTE
Where row_num > 1
Order by PropertyAddress

-- Delete Unused Columns

ALTER TABLE SqlTutorial.dbo.Housing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate

