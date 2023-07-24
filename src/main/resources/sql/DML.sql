DROP TABLE EMP;

CREATE TABLE EMP (
                     emp_num	number	NOT NULL,
                     email	varchar2(100)	NOT NULL,
                     emp_name	varchar2(50)	NOT NULL,
                     pwd	varchar2(300)	NOT NULL,
                     hire_date	date	NOT NULL	DEFAULT sysdate,
                     departure_date	date	NULL,
                     reason	varchar2(4000)	NULL,
                     direct_num	varchar2(50)	NOT NULL,
                     phone	varchar2(50)	NOT NULL,
                     regist_num	varchar2(50)	NOT NULL,
                     annual_num	number	NOT NULL,
                     post_code	number	NULL,
                     address	varchar2(500)	NOT NULL,
                     detail_address	varchar2(100)	NULL,
                     permission_type	char(1)	NULL	DEFAULT '0',
                     dept	varchar2(20)	NULL,
                     rank	varchar2(20)	NULL,
                     remarks	varchar2(50)	NULL,
                     work_num	number	NOT NULL
);

insert into emp values(1000,'테스트','b10249b3b99c35a0fca54c73c2194879343ff6ebd35fe937b20f4e528522bb8c','q1@qwe.qwe','2023-03-01','','','02-000-0000','010-2400-0000','95013-0000000',1,03499,'증산로','',1,'','');

DROP TABLE CERTIFICATE;

CREATE TABLE CERTIFICATE (
                             cert_num	number	NOT NULL,
                             emp_num	number	NOT NULL,
                             crtfc_name	varchar2(100)	NOT NULL,
                             issuer	varchar2(100)	NOT NULL,
                             acquisition_date	date	NOT NULL,
                             remarks	varchar2(50)	NULL
);

DROP TABLE CAREER;

CREATE TABLE CAREER (
                        career_num	number	NOT NULL,
                        emp_num	number	NOT NULL,
                        company_name	varchar2(100)	NOT NULL,
                        dept	varchar2(50)	NOT NULL,
                        rank	varchar2(50)	NULL,
                        main_tesk	varchar2(100)	NULL,
                        join_date	date	NOT NULL,
                        leave_date	date	NOT NULL,
                        remarks	varchar2(50)	NULL
);

DROP TABLE CODE_TABLE;

CREATE TABLE CODE_TABLE (
                            code_name	varchar2(20)	NOT NULL,
                            code_value	varchar2(50)	NOT NULL,
                            code_order	number	NULL,
                            parent_code	varchar2(20)	NULL,
                            remarks	varchar2(50)	NULL
);


DROP SEQUENCE dept_seq;
CREATE SEQUENCE  dept_seq
    START WITH 1
    INCREMENT BY 1;

insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('','R001','직급','직급관련테이블');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('R001','R001'||lpad(dept_seq.nextval,2,0),'대표','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('R001','R001'||lpad(dept_seq.nextval,2,0),'대표이사','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('R001','R001'||lpad(dept_seq.nextval,2,0),'부장','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('R001','R001'||lpad(dept_seq.nextval,2,0),'차장','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('R001','R001'||lpad(dept_seq.nextval,2,0),'과장','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('R001','R001'||lpad(dept_seq.nextval,2,0),'대리','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('R001','R001'||lpad(dept_seq.nextval,2,0),'사원','');

DROP SEQUENCE  rank_seq;
CREATE SEQUENCE  rank_seq
    START WITH 1
    INCREMENT BY 1;

insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('','D001','부서','부서관련테이블');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('D001','D001'||lpad(rank_seq.nextval,2,0),'인사팀','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('D001','D001'||lpad(rank_seq.nextval,2,0),'프론트팀','');
insert into code_table(parent_code,code_name,code_value,remarks) VALUES ('D001','D001'||lpad(rank_seq.nextval,2,0),'백엔드팀','');

DROP TABLE VACATION;

CREATE TABLE VACATION (
                          vctn_num	number	NOT NULL,
                          emp_num	number	NOT NULL,
                          vctn_type_num	number	NOT NULL,
                          vctn_start_date	TIMESTAMP(6)	NOT NULL,
                          vctn_end_date	TIMESTAMP(6)	NOT NULL,
                          vctn_application_date	date	NOT NULL,
                          vctn_reason	varchar2(4000)	NULL
);

DROP TABLE ATTENDANCE;

CREATE TABLE ATTENDANCE (
                            att_num	number	NOT NULL,
                            EMP_NUM	number	NOT NULL,
                            ATT_STATUS	varchar2(50)	NULL,
                            GO_WORK	date	NULL,
                            LEAVE_WORK	date	NULL,
                            BREAK_TIME	number	NULL	DEFAULT 1
);

DROP TABLE WORK_SCHEDULE_TYPE;

CREATE TABLE WORK_SCHEDULE_TYPE (
                                    work_sch_type_num	number	NOT NULL,
                                    work_name	varchar(50)	NOT NULL,
                                    work_start	date	NOT NULL,
                                    work_end	date	NOT NULL
);

DROP TABLE WORK_SCHEDULE;

CREATE TABLE WORK_SCHEDULE (
                               work_sch_num	number	NOT NULL,
                               work_sch_type_num	number	NULL,
                               emp_num2	number	NULL,
                               GO_WORK	date	NULL,
                               LEAVE_WORK	date	NULL,
                               remarks	varchar2(500)	NULL
);

DROP TABLE VACATION_TYPE;

CREATE TABLE VACATION_TYPE (
                               vctn_type_num	number	NOT NULL,
                               vctn_name	varchar2(100)	NOT NULL,
                               vctn_time	number	NULL,
                               deduction_day	number	NULL
);

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8시간,4시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'VACATION_TYPE', @level2type=N'COLUMN',@level2name=N'vctn_time';

DROP TABLE REQUEST_HISTORY;

CREATE TABLE REQUEST_HISTORY (
                                 rqst_hstry_num	number	NOT NULL,
                                 emp_num	number	NOT NULL,
                                 request_num	number	NOT NULL,
                                 request_type	char(1)	NOT NULL,
                                 state	char(1)	NULL	DEFAULT '0',
                                 approver_note	varchar2(20)	NULL,
                                 application_date	date	NOT NULL	DEFAULT sysdate
);

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'요청사항 조인' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'REQUEST_HISTORY', @level2type=N'COLUMN',@level2name=N'request_num';

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'V휴A근W일정' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'REQUEST_HISTORY', @level2type=N'COLUMN',@level2name=N'request_type';

DROP TABLE WORK;

CREATE TABLE WORK (
                      work_num	number	NOT NULL,
                      work_name	varchar2(50)	NOT NULL,
                      pay	number	NOT NULL,
                      remarks	varchar2(50)	NULL
);

DROP TABLE FIXED_WORKING_DAYS;

CREATE TABLE FIXED_WORKING_DAYS (
                                    day_num	number	NOT NULL,
                                    work_num	number	NOT NULL,
                                    day	VARCHAR2(20 BYTE)	NULL
);

DROP TABLE WEEKLY_HOLIDAY;

CREATE TABLE WEEKLY_HOLIDAY (
                                day_num	number	NOT NULL,
                                work_num	number	NOT NULL,
                                day	VARCHAR2(20 BYTE)	NULL
);

DROP TABLE image;

CREATE TABLE image (
                       emp_num	number	NOT NULL,
                       ofile	varchar2(200)	NOT NULL,
                       sfile	varchar2(200)	NOT NULL
);

ALTER TABLE EMP ADD CONSTRAINT PK_EMP PRIMARY KEY (
                                                   emp_num
    );

ALTER TABLE CERTIFICATE ADD CONSTRAINT PK_CERTIFICATE PRIMARY KEY (
                                                                   cert_num,
                                                                   emp_num
    );

ALTER TABLE CAREER ADD CONSTRAINT PK_CAREER PRIMARY KEY (
                                                         career_num,
                                                         emp_num
    );

ALTER TABLE CODE_TABLE ADD CONSTRAINT PK_CODE_TABLE PRIMARY KEY (
                                                                 code_name,
                                                                 code_value
    );

ALTER TABLE VACATION ADD CONSTRAINT PK_VACATION PRIMARY KEY (
                                                             vctn_num
    );

ALTER TABLE ATTENDANCE ADD CONSTRAINT PK_ATTENDANCE PRIMARY KEY (
                                                                 att_num,
                                                                 EMP_NUM
    );

ALTER TABLE WORK_SCHEDULE_TYPE ADD CONSTRAINT PK_WORK_SCHEDULE_TYPE PRIMARY KEY (
                                                                                 work_sch_type_num
    );

ALTER TABLE WORK_SCHEDULE ADD CONSTRAINT PK_WORK_SCHEDULE PRIMARY KEY (
                                                                       work_sch_num
    );

ALTER TABLE VACATION_TYPE ADD CONSTRAINT PK_VACATION_TYPE PRIMARY KEY (
                                                                       vctn_type_num
    );

ALTER TABLE REQUEST_HISTORY ADD CONSTRAINT PK_REQUEST_HISTORY PRIMARY KEY (
                                                                           rqst_hstry_num
    );

ALTER TABLE WORK ADD CONSTRAINT PK_WORK PRIMARY KEY (
                                                     work_num
    );

ALTER TABLE FIXED_WORKING_DAYS ADD CONSTRAINT PK_FIXED_WORKING_DAYS PRIMARY KEY (
                                                                                 day_num
    );

ALTER TABLE WEEKLY_HOLIDAY ADD CONSTRAINT PK_WEEKLY_HOLIDAY PRIMARY KEY (
                                                                         day_num
    );

ALTER TABLE image ADD CONSTRAINT PK_IMAGE PRIMARY KEY (
                                                       emp_num
    );

ALTER TABLE CERTIFICATE ADD CONSTRAINT FK_EMP_TO_CERTIFICATE_1 FOREIGN KEY (
                                                                            emp_num
    )
    REFERENCES EMP (
                    emp_num
        );

ALTER TABLE CAREER ADD CONSTRAINT FK_EMP_TO_CAREER_1 FOREIGN KEY (
                                                                  emp_num
    )
    REFERENCES EMP (
                    emp_num
        );

ALTER TABLE ATTENDANCE ADD CONSTRAINT FK_EMP_TO_ATTENDANCE_1 FOREIGN KEY (
                                                                          EMP_NUM
    )
    REFERENCES EMP (
                    emp_num
        );

ALTER TABLE image ADD CONSTRAINT FK_EMP_TO_image_1 FOREIGN KEY (
                                                                emp_num
    )
    REFERENCES EMP (
                    emp_num
        );