create or replace PACKAGE BODY xxb_home_loan_pkg 
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

    FUNCTION get_monthly_amortization (
                                       p_term       NUMBER,
                                       p_rate       NUMBER,
                                       p_outstanding_bal  NUMBER
    ) RETURN NUMBER IS

        lv_outstanding_bal           NUMBER;
        lv_rate                      NUMBER;
        lv_term                      NUMBER;
        lv_term_converted            NUMBER;
        lv_rate_converted            NUMBER;
        lv_rate_monthly              NUMBER;
        lv_monthly_amortization_tot  NUMBER;
        lv_monthly_amortization1     NUMBER;
        lv_monthly_amortization2     NUMBER;
        lv_monthly_amortization      NUMBER;
        lv_step                      NUMBER;
        lv_prog_name                 VARCHAR2(100) := 'get_monthly_amortization: ';
        
        lv_no_loan_rate_exception    EXCEPTION;
    BEGIN

        lv_step := 1;
        IF p_rate IS NULL THEN 
           RAISE lv_no_loan_rate_exception;
        END IF;
        
        lv_step := 2;
        lv_outstanding_bal := p_outstanding_bal;
        lv_rate := p_rate;
        lv_term := p_term;
        lv_term_converted := lv_term * 12;
        lv_rate_converted := lv_rate / 100;
        lv_rate_monthly := lv_rate_converted / 12;
        
        lv_step := 3;
        lv_monthly_amortization1 := ( lv_outstanding_bal * lv_rate_converted / 12 ) * POWER((1 + lv_rate_converted / 12), lv_term_converted);
        lv_monthly_amortization2 := POWER((1 + lv_rate_converted / 12), lv_term_converted) - 1;
        lv_monthly_amortization_tot := round(lv_monthly_amortization1 / lv_monthly_amortization2, 2);
        lv_monthly_amortization := lv_monthly_amortization_tot;
        
        RETURN lv_monthly_amortization;
    
    EXCEPTION 
       WHEN lv_no_loan_rate_exception THEN
          dbms_output.put_line(lv_prog_name||lv_step||' '||'Cannot generate: Loan rate is empty or zero');
       WHEN OTHERS THEN
          NULL;
    END get_monthly_amortization;

    FUNCTION get_interest (
                           p_term       NUMBER,
                           p_rate       NUMBER,
                           p_outstanding_bal  NUMBER
    ) RETURN NUMBER IS

        lv_outstanding_bal                 NUMBER;
        lv_rate                      NUMBER;
        lv_term                      NUMBER;
        lv_term_converted            NUMBER;
        lv_rate_converted            NUMBER;
        lv_rate_monthly              NUMBER;
        lv_monthly_interest_payment  NUMBER;
        lv_monthly_amortization1     NUMBER;
        lv_monthly_amortization2     NUMBER;
        lv_interest                  NUMBER;
        lv_step                      NUMBER;
        lv_prog_name                 VARCHAR2(100) := 'get_interest: ';
        
        lv_no_loan_rate_exception    EXCEPTION;
    BEGIN

        lv_step := 1;
        IF p_rate IS NULL THEN 
           RAISE lv_no_loan_rate_exception;
        END IF;
        
        lv_outstanding_bal := p_outstanding_bal;
        lv_rate := p_rate;
        lv_term := p_term;
        lv_term_converted := lv_term * 12;
        lv_rate_converted := lv_rate / 100;
        
        lv_step := 2;
        lv_rate_monthly := lv_rate_converted / 12;
        lv_monthly_amortization1 := ( lv_rate_monthly * ( 1 + lv_rate_monthly / lv_term_converted ) );
        lv_monthly_amortization2 := ( 1 + lv_rate_monthly / lv_term_converted );
        lv_monthly_interest_payment := round(lv_outstanding_bal *(lv_monthly_amortization1 / lv_monthly_amortization2), 2);
        lv_interest := lv_monthly_interest_payment;
        
        RETURN lv_interest;
        
    EXCEPTION 
       WHEN lv_no_loan_rate_exception THEN
          dbms_output.put_line(lv_prog_name||lv_step||' '||'Cannot generate: Loan rate is empty or zero');
       WHEN OTHERS THEN
          NULL;
    END get_interest;

-- For demo purpose i'm returning parameters in different ways
    PROCEDURE main(p_cust_number NUMBER,p_loan_number VARCHAR2,p_insurance_amt NUMBER,p_period NUMBER,p_remaining_term NUMBER,p_rate NUMBER,p_out_monthly_amortization OUT NUMBER,p_in_out_outstanding_bal IN OUT NUMBER,p_out_interest OUT NUMBER,p_out_rec OUT xxb_home_loan_pkg.repricing_computation_r) 
    IS
        lv_interest              NUMBER;
        lv_monthly_amortization  NUMBER;
        lv_outstanding_bal             NUMBER;
        lv_rate                  NUMBER;
        lv_term                  NUMBER;
        lv_insurance_others      NUMBER;
        lv_period                NUMBER;
        lv_total_amortization    NUMBER := 0;
        lv_total_principal       NUMBER := 0;
        lv_total_interest        NUMBER := 0;
        lv_outstanding_balance   NUMBER := 0;
        lv_remaining_term        NUMBER;
        
        lv_step                      NUMBER;
        lv_prog_name                 VARCHAR2(100) := 'main: ';
        
    BEGIN
        lv_step := 1;
        -- comment out if using without db [
        BEGIN
            SELECT
                ls.loan_term,
                ls.new_outstanding_bal
            INTO
                lv_term,
                lv_outstanding_bal
            FROM
                hr.customer      c,
                hr.loan_summary  ls
            WHERE
                    c.customer_id = ls.customer_id
                AND c.customer_id = p_cust_number
                AND ls.loan_number = p_loan_number;

        EXCEPTION
           WHEN OTHERS THEN
              dbms_output.put_line(lv_prog_name||lv_step||' '||SUBSTR('SQLCODE: '||SQLCODE||' - '||SQLERRM,1,4000));
        END;
        -- comment out if using without db ]
        --lv_outstanding_bal := 2292318.47;  -- uncomment if using without db
        
        IF p_in_out_outstanding_bal IS NULL THEN 
           lv_outstanding_bal := lv_outstanding_bal;
        ELSE
            lv_outstanding_bal := p_in_out_outstanding_bal;
        END IF;

        lv_step := 2;
        lv_insurance_others := p_insurance_amt;
        lv_period := p_period;
        lv_remaining_term := p_remaining_term;
        lv_rate := p_rate;
        
        lv_step := 3;
        lv_monthly_amortization := get_monthly_amortization(lv_remaining_term, lv_rate, lv_outstanding_bal);
        p_out_monthly_amortization := lv_monthly_amortization;
        
        lv_step := 4;
        p_out_interest := get_interest (p_term=>lv_remaining_term,p_rate=>lv_rate,p_outstanding_bal=>lv_outstanding_bal);
        lv_interest := p_out_interest;
        p_in_out_outstanding_bal := lv_outstanding_bal;
        
        lv_step := 5;
        p_out_rec.monthly_amortization := p_out_monthly_amortization;
        p_out_rec.outstanding_bal := lv_outstanding_bal;
        p_out_rec.interest := p_out_interest;
       
    EXCEPTION 
       WHEN OTHERS THEN
          dbms_output.put_line(lv_prog_name||lv_step||' '||SUBSTR(SQLCODE||' '||SQLERRM,1,4000));
    END main;
END xxb_home_loan_pkg;