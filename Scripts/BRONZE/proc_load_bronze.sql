

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
	BEGIN TRY 
		SET @batch_start_time= GETDATE();
		PRINT '=======================================================';
		PRINT 'LOADING THE BRONZE LAYER';
		PRINT '=======================================================' ;

		PRINT '-------------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '-------------------------------------------------------';

		SET @start_time= GETDATE();
		PRINT'>>Truncating table: bronze.crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT '>>Inserting Data Into : bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info 
		FROM 'C:\Users\ROHITH\Downloads\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time= GETDATE();
		PRINT '>> Load duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'
		PRINT '>>----------------';

		SET @start_time= GETDATE();
		PRINT'>>Truncating table: bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT '>>Inserting Data Into : bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info 
		FROM 'C:\Users\ROHITH\Downloads\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time= GETDATE();
		PRINT '>> Load duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'
		PRINT '>>----------------';

		SET @start_time= GETDATE();
		PRINT'>>Truncating table: bronze.crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT '>>Inserting Data Into : bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\ROHITH\Downloads\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time= GETDATE();
		PRINT '>> Load duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'
		PRINT '>>----------------';

		PRINT '-------------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '-------------------------------------------------------';

		SET @start_time= GETDATE();
		PRINT'>>Truncating table: bronze.erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT '>>Inserting Data Into : bronze.erp_loc_a101'
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\ROHITH\Downloads\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time= GETDATE();
		PRINT '>> Load duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'
		PRINT '>>----------------';

		SET @start_time= GETDATE();
		PRINT'>>Truncating table: bronze.erp__cust_az12'
		TRUNCATE TABLE bronze.erp__cust_az12;
		PRINT '>>Inserting Data Into : bronze.erp__cust_az12'
		BULK INSERT bronze.erp__cust_az12
		FROM 'C:\Users\ROHITH\Downloads\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time= GETDATE();
		PRINT '>> Load duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'
		PRINT '>>----------------';

		SET @start_time= GETDATE();
		PRINT'>>Truncating table: bronze.erp_px_cat_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT '>>Inserting Data Into : bronze.erp_px_cat_g1v2'
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\ROHITH\Downloads\sql-data-warehouse-project (1)\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time= GETDATE();
		PRINT '>> Load duration: '+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'
		PRINT '>>----------------';

		SET @batch_end_time= GETDATE() 
		PRINT '===================================================';
		PRINT 'Loading Bronze Layer is completed'
		PRINT ' - Total Load Duration :' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'seconds';
		PRINT '===================================================';
	END TRY
	BEGIN CATCH
		PRINT '===================================================';
		PRINT 'ERROR OCCURED DURING LOADING ()';
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '===================================================';

	END CATCH 
END
