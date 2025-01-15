SET SERVEROUTPUT ON;
/*******************************************************************************
***  Title: Arvin T Prj 01 - Monthly Amortization computation
***  Version: 1.0
***  Created by: Arvin T
***  Created date: 15-Jan-2025
***  Last Updated by: Arvin T
***  Last Updated Date: 
***  Comments: Initial version
********************************************************************************/

DECLARE

    lv_in_loan_nbr            VARCHAR2(12);
    lv_currency               CONSTANT VARCHAR2(3) := 'PHP';
    lv_cust_nbr               NUMBER;
    lv_in_insurance_amt       NUMBER;
    lv_in_period              CONSTANT NUMBER := 12;
    lv_in_remaining_term      NUMBER;
    lv_in_rate                NUMBER;
    --
    lv_out_monthly_amort      NUMBER;
    lv_def_monthly_amort      NUMBER;
    lv_last_outstanding_bal   NUMBER;
    lv_in_out_outstanding_bal NUMBER;
    lv_out_interest           NUMBER;
    lv_tot_principal          NUMBER := 0;
    lv_tot_interest           NUMBER := 0;
    lv_tot_amort              NUMBER := 0;
    
    lv_out_rec                xxb_home_loan_pkg.repricing_computation_r;
    
BEGIN

--Initialization
    lv_in_loan_nbr := 'LN1201201401';
    lv_cust_nbr := 2;
    lv_in_insurance_amt := 1044.55;
    lv_in_remaining_term := 16;
    lv_in_rate := 11.26;
/*
--Calling main procedure
    xxb_home_loan_pkg.main(p_cust_number => lv_cust_nbr,
                          p_loan_number => lv_in_loan_nbr,
                          p_insurance_amt => lv_in_insurance_amt,
                          p_period => lv_in_period,
                          p_remaining_term => lv_in_remaining_term,
                          p_rate => lv_in_rate,
                          p_out_monthly_amortization => lv_out_monthly_amort,
                          p_out_outstanding_bal => lv_in_out_outstanding_bal,
                          p_out_interest => lv_out_interest,
                          p_out_rec => lv_out_rec
                          );
                          
    IF lv_out_monthly_amort IS NOT NULL THEN
    
        dbms_output.put_line('NORMAL OUTPUT:'||CHR(10)||'Monthly Amotization: '||lv_currency||' '
                             || lv_out_monthly_amort
                             || chr(10)
                             || 'Monthly Amortization+Insurance: '||lv_currency||' '
                             ||(lv_out_monthly_amort + lv_in_insurance_amt)
                             );
    
        dbms_output.put_line('Interest: '||lv_currency||' '
                             || lv_out_interest
                             || chr(10)
                             || 'Total monthly principal: '||lv_currency||' '
                             ||(lv_out_monthly_amort - lv_out_interest)
                             || chr(10)
                             || 'New outstanding balance: '||lv_currency||' '
                             ||(lv_in_out_outstanding_bal - (lv_out_monthly_amort - lv_out_interest))
                             ||CHR(10));
    END IF;                         

    IF lv_out_rec.monthly_amortization IS NOT NULL THEN    
        dbms_output.put_line('RECORD:'||CHR(10)||'Monthly Amotization: '||lv_currency||' '
                         || lv_out_rec.monthly_amortization
                         || chr(10)
                         || 'Monthly Amortization+Insurance: '||lv_currency||' '
                         ||(lv_out_rec.monthly_amortization + lv_in_insurance_amt)
                         );
    
       dbms_output.put_line('Interest: '||lv_currency||' '
                         || lv_out_rec.interest
                         || chr(10)
                         || 'Total monthly principal: '||lv_currency||' '
                         ||(lv_out_rec.monthly_amortization - lv_out_rec.interest)
                         || chr(10)
                         || 'New outstanding balance: '||lv_currency||' '
                         ||(lv_in_out_outstanding_bal - (lv_out_rec.monthly_amortization - lv_out_rec.interest)));
    END IF;
*/
FOR i IN 1..12
LOOP

    xxb_home_loan_pkg.main(p_cust_number => lv_cust_nbr,
                          p_loan_number => lv_in_loan_nbr,
                          p_insurance_amt => lv_in_insurance_amt,
                          p_period => lv_in_period,
                          p_remaining_term => lv_in_remaining_term,
                          p_rate => lv_in_rate,
                          p_out_monthly_amortization => lv_out_monthly_amort,
                          p_in_out_outstanding_bal => lv_in_out_outstanding_bal,
                          p_out_interest => lv_out_interest,
                          p_out_rec => lv_out_rec
                          );
    lv_last_outstanding_bal := lv_in_out_outstanding_bal;       
    IF i = 1 THEN
       lv_def_monthly_amort := lv_out_monthly_amort;
    END IF;

    lv_in_out_outstanding_bal := (lv_last_outstanding_bal - (lv_def_monthly_amort - lv_out_rec.interest)); 
    lv_tot_principal     := lv_tot_principal + (lv_def_monthly_amort - lv_out_rec.interest);
    lv_tot_interest      := lv_tot_interest + lv_out_rec.interest;
    lv_tot_amort         := lv_tot_amort + lv_def_monthly_amort;

    IF lv_def_monthly_amort IS NOT NULL THEN    
        dbms_output.put_line('RECORD# '||i||CHR(10)||'Monthly Amotization: '||lv_currency||' '
                         || lv_def_monthly_amort
                         || chr(10)
                         || 'Monthly Amortization+Insurance: '||lv_currency||' '
                         ||(lv_def_monthly_amort + lv_in_insurance_amt)
                         );

       dbms_output.put_line('Interest: '||lv_currency||' '
                         || lv_out_rec.interest
                         || chr(10)
                         || 'Total monthly principal: '||lv_currency||' '
                         ||(lv_def_monthly_amort - lv_out_rec.interest)
                         || chr(10)
                         || 'New outstanding balance: '||lv_currency||' '
                         ||(lv_in_out_outstanding_bal)
                         ||CHR(10)||CHR(10)||'------------------------------------------------------------------');
                         
    END IF;
    
END LOOP;


dbms_output.put_line('Total Principal: '||lv_currency||' '||lv_tot_principal||CHR(10)||'Total Interest: '||lv_currency||' '||lv_tot_interest||CHR(10)||'Total Amortization; '||lv_currency||' '||lv_tot_amort);


EXCEPTION
   WHEN OTHERS THEN
      dbms_output.put_line('Calling script: '||SUBSTR(SQLCODE||' '||SQLERRM,1,4000));
END;
/
