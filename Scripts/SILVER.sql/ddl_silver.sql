IF OBJECT_ID ('silver.crm_cust_info','U') IS NOT NULL 
DROP TABLE silver.crm_cust_info;
GO
CREATE TABLE silver.crm_cust_info(
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_marital_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date DATE,
dwn_create_date DATETIME2 DEFAULT GETDATE()
);

GO
IF OBJECT_ID ('silver.crm_prd_info','U') IS NOT NULL 
DROP TABLE silver.crm_prd_info;
GO
CREATE TABLE silver.crm_prd_info(
prd_id INT,
cat_id NVARCHAR(50),
prd_key NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cost NVARCHAR(50),
prd_line NVARCHAR(50),
prd_start_date DATE,
prd_end_date DATE,
dwn_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID ('silver.crm_sales_details','U') IS NOT NULL 
DROP TABLE silver.crm_sales_details;
GO
CREATE TABLE silver.crm_sales_details(
sls_ord_num NVARCHAR(30),
sls_prd_key NVARCHAR(30),
sls_cust_id int,
sls_order_dt date,
sls_ship_dt date,
sls_due_dt date,
sls_sales int,
sls_quantity int,
sls_price int,
dwn_create_date DATETIME2 DEFAULT GETDATE()
);

GO

IF OBJECT_ID ('silver.erp__cust_az12','U') IS NOT NULL 
DROP TABLE silver.erp__cust_az12;
GO
CREATE TABLE silver.erp__cust_az12(
	cid NVARCHAR(50),
	bdate DATE,
	gen NVARCHAR(50),
	dwn_create_date DATETIME2 DEFAULT GETDATE()
);

GO

IF OBJECT_ID ('silver.erp_loc_a101','U') IS NOT NULL 
DROP TABLE silver.erp_loc_a101;
GO

CREATE TABLE silver.erp_loc_a101(
	cid NVARCHAR(50),
	cntry NVARCHAR(50),
	dwn_create_date DATETIME2 DEFAULT GETDATE()
);

GO

IF OBJECT_ID ('silver.erp_px_cat_g1v2','U') IS NOT NULL 
DROP TABLE silver.erp_px_cat_g1v2;

GO
CREATE TABLE silver.erp_px_cat_g1v2(
	id				NVARCHAR(50),
	cat				NVARCHAR(50),
	subcat			NVARCHAR(50),
	maintenance		NVARCHAR(50),
	dwn_create_date DATETIME2 DEFAULT GETDATE()
);
