BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => '"FRUIT"."FRESHNESS_CHECK_JOB"',
            job_type => 'STORED_PROCEDURE',
            job_action => 'FRUIT.FRESHNESS_CHECK',
            number_of_arguments => 0,
            start_date => NULL,
            repeat_interval => NULL,
            end_date => NULL,
            enabled => FALSE,
            auto_drop => FALSE,
            comments => '');

         
     
 
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"FRUIT"."FRESHNESS_CHECK_JOB"', 
             attribute => 'store_output', value => TRUE);
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"FRUIT"."FRESHNESS_CHECK_JOB"', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
      
   
  
    
    DBMS_SCHEDULER.enable(
             name => '"FRUIT"."FRESHNESS_CHECK_JOB"');
END;


--------------------------------------------------------
--------------------------------------------------------

BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => '"FRUIT"."DAILY_REFILL"',
            job_type => 'STORED_PROCEDURE',
            job_action => 'FRUIT.REFILL_FRUITS',
            number_of_arguments => 0,
            start_date => NULL,
            repeat_interval => NULL,
            end_date => NULL,
            enabled => FALSE,
            auto_drop => FALSE,
            comments => '');

         
     
 
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"FRUIT"."DAILY_REFILL"', 
             attribute => 'store_output', value => TRUE);
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"FRUIT"."DAILY_REFILL"', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
      
   
  
    
    DBMS_SCHEDULER.enable(
             name => '"FRUIT"."DAILY_REFILL"');
END;


--------------------------------------------------------
--------------------------------------------------------


BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => '"FRUIT"."OFFER_LOW_FRESHNESS_JOB"',
            job_type => 'STORED_PROCEDURE',
            job_action => 'FRUIT.OFFER_LOW_RIPENS_LEVEL',
            number_of_arguments => 0,
            start_date => NULL,
            repeat_interval => NULL,
            end_date => NULL,
            enabled => FALSE,
            auto_drop => FALSE,
            comments => '');

         
     
 
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"FRUIT"."OFFER_LOW_FRESHNESS_JOB"', 
             attribute => 'store_output', value => TRUE);
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"FRUIT"."OFFER_LOW_FRESHNESS_JOB"', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
      
   
  
    
    DBMS_SCHEDULER.enable(
             name => '"FRUIT"."OFFER_LOW_FRESHNESS_JOB"');
END;


--------------------------------------------------------
--------------------------------------------------------



BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => '"FRUIT"."FRESHNESS_DECAY_JOB"',
            job_type => 'STORED_PROCEDURE',
            job_action => 'FRUIT.FRESHNESS_DECAY',
            number_of_arguments => 0,
            start_date => NULL,
            repeat_interval => NULL,
            end_date => NULL,
            enabled => FALSE,
            auto_drop => FALSE,
            comments => '');

         
     
 
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"FRUIT"."FRESHNESS_DECAY_JOB"', 
             attribute => 'store_output', value => TRUE);
    DBMS_SCHEDULER.SET_ATTRIBUTE( 
             name => '"FRUIT"."FRESHNESS_DECAY_JOB"', 
             attribute => 'logging_level', value => DBMS_SCHEDULER.LOGGING_OFF);
      
   
  
    
    DBMS_SCHEDULER.enable(
             name => '"FRUIT"."FRESHNESS_DECAY_JOB"');
END;


--------------------------------------------------------
--------------------------------------------------------


