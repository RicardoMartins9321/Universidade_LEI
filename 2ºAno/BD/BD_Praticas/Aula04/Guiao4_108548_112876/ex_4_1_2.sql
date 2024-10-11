GO

--- Apaga as tabelas se já existirem

IF OBJECT_ID('VOOS_Fare', 'U') IS NOT NULL
    DROP TABLE VOOS_Fare;
IF OBJECT_ID('VOOS_Seat', 'U') IS NOT NULL
    DROP TABLE VOOS_Seat;
IF OBJECT_ID('VOOS_Leg_Instance', 'U') IS NOT NULL
    DROP TABLE VOOS_Leg_Instance;
IF OBJECT_ID('VOOS_Flight_Leg', 'U') IS NOT NULL
    DROP TABLE VOOS_Flight_Leg;
IF OBJECT_ID('VOOS_Airplane', 'U') IS NOT NULL
    DROP TABLE VOOS_Airplane;
IF OBJECT_ID('VOOS_Can_Land', 'U') IS NOT NULL
    DROP TABLE VOOS_Can_Land;
IF OBJECT_ID('VOOS_Flight', 'U') IS NOT NULL
    DROP TABLE VOOS_Flight;
IF OBJECT_ID('VOOS_Airplane_Type', 'U') IS NOT NULL
    DROP TABLE VOOS_Airplane_Type;
IF OBJECT_ID('VOOS_Airport', 'U') IS NOT NULL
    DROP TABLE VOOS_Airport;


CREATE TABLE VOOS_Airport (
    Airport_Code    int             NOT NULL    PRIMARY KEY,
    Cidade          varchar(128)    NOT NULL,
    Estado          varchar(128)    NOT NULL,
    Nome            varchar(128)    NOT NULL,
);

CREATE TABLE VOOS_Airplane_Type (
    AType_Name      varchar(128)    NOT NULL    PRIMARY KEY,
    Company         varchar(128)    NOT NULL,
    Max_Seats       int             NOT NULL,
);

CREATE TABLE VOOS_Flight (
    [Number]        int             NOT NULL    PRIMARY KEY,
    Airline         varchar(128)    NOT NULL,
    Weekdays        varchar(128)    NOT NULL,
);

CREATE TABLE VOOS_Can_Land (
    Airplane_Type   varchar(128)     NOT NULL   REFERENCES VOOS_Airplane_Type(AType_Name),
    Airport         int			     NOT NULL   REFERENCES VOOS_Airport(Airport_Code),
);

CREATE TABLE VOOS_Airplane (
    Airplane_Code   int             NOT NULL    PRIMARY KEY,
    Total_Seats     varchar(128)    NOT NULL,
    Airplane_Type   varchar(128)    NOT NULL    REFERENCES VOOS_Airplane_Type(AType_Name),
);

CREATE TABLE VOOS_Flight_Leg (
    Leg_Numb        int             NOT NULL    PRIMARY KEY,
    Schel_Dep_Time  time            NOT NULL,
    Schel_Arr_Time  time            NOT NULL,
    Flight          int             NOT NULL    REFERENCES VOOS_Flight([Number]),
);

CREATE TABLE VOOS_Leg_Instance (
    [Date]          date            NOT NULL    PRIMARY KEY,
    N_Avail_Seats   int             NOT NULL,
    Airplane        int             NOT NULL    REFERENCES VOOS_Airplane(Airplane_Code),
    Dep_Time        time            NOT NULL,
    Arr_Time        time            NOT NULL,
    Flight_Leg      int             NOT NULL    REFERENCES VOOS_Flight_Leg(Leg_Numb),
    Flight          int             NOT NULL    REFERENCES VOOS_Flight([Number]),
    Depart_Airport  int             NOT NULL    REFERENCES VOOS_Airport(Airport_Code),
    Arrival_Airport int             NOT NULL    REFERENCES VOOS_Airport(Airport_Code),
);

CREATE TABLE VOOS_Seat (
    Seat_Numb       int             NOT NULL    PRIMARY KEY,
    Costumer_Name   varchar(128)    NOT NULL,
    CPhone          int             NOT NULL,
    Leg_Instance    date            NOT NULL    REFERENCES VOOS_Leg_Instance([Date]),
);

CREATE TABLE VOOS_Fare (
    Fare_Code       int             NOT NULL    PRIMARY KEY,
    Amount          int             NOT NULL,
    Flight          int             NOT NULL    REFERENCES VOOS_Flight([Number]),
);
