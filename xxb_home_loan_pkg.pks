create or replace PACKAGE xxb_home_loan_pkg 
AUTHID DEFINER -- samp only
AS  
/*******************************************************************************
***  Title: Arvin T Prj 01 - Monthly Amortization computation
***  Version: 1.0
***  Created by: Arvin T
***  Created date: 15-Jan-2025
***  Last Updated by: Arvin T
***  Last Updated Date: 
***  Comments: Initial version
********************************************************************************/
TYPE repricing_computation_r IS RECORD
(
monthly_amortization NUMBER,
outstanding_bal NUMBER,
interest NUMBER
);

TYPE repricing_computation_t IS TABLE OF repricing_computation_r INDEX BY BINARY_INTEGER ;

-- For demo purpose i'm returning parameters in different ways
PROCEDURE main(p_cust_number NUMBER,p_loan_number VARCHAR2,p_insurance_amt NUMBER,p_period NUMBER,p_remaining_term NUMBER,p_rate NUMBER,p_out_monthly_amortization OUT NUMBER,p_in_out_outstanding_bal IN OUT NUMBER,p_out_interest OUT NUMBER,p_out_rec OUT xxb_home_loan_pkg.repricing_computation_r);

END xxb_home_loan_pkg;