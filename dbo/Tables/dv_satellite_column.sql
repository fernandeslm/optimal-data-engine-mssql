﻿CREATE TABLE [dbo].[dv_satellite_column] (
    [satellite_col_key]          INT                IDENTITY (1, 1) NOT NULL,
    [satellite_key]              INT                NOT NULL,
    [column_key]                 INT                CONSTRAINT [DF_dv_satellite_column_column_key] DEFAULT ((0)) NOT NULL,
    [column_name]                VARCHAR (128)      NOT NULL,
    [column_type]                VARCHAR (30)       NOT NULL,
    [column_length]              INT                NULL,
    [column_precision]           INT                NULL,
    [column_scale]               INT                NULL,
    [Collation_Name]             [sysname]          NULL,
    [satellite_ordinal_position] INT                NOT NULL,
    [inline_function]            VARCHAR (4096)     NULL,
    [func_calculation_seq]       INT                CONSTRAINT [DF_dv_satellite_column_calc_seq] DEFAULT ((0)) NOT NULL,
    [release_key]                INT                CONSTRAINT [DF_dv_satellite_column_release_key] DEFAULT ((0)) NOT NULL,
    [version_number]             INT                CONSTRAINT [DF_dv_satellite_column_version_number] DEFAULT ((1)) NOT NULL,
    [updated_by]                 VARCHAR (30)       CONSTRAINT [DF_dv_satellite_column_updated_by] DEFAULT (suser_name()) NULL,
    [updated_datetime]           DATETIMEOFFSET (7) CONSTRAINT [DF_dv_satellite_column_updated_datetime] DEFAULT (sysdatetimeoffset()) NULL,
    CONSTRAINT [PK__dv_satellite_column] PRIMARY KEY CLUSTERED ([satellite_col_key] ASC),
    CONSTRAINT [FK__dv_satellite_column__dv_column] FOREIGN KEY ([column_key]) REFERENCES [dbo].[dv_column] ([column_key]),
    CONSTRAINT [FK__dv_satellite_column__dv_satellite] FOREIGN KEY ([satellite_key]) REFERENCES [dbo].[dv_satellite] ([satellite_key]),
    CONSTRAINT [FK_dv_satellite_column_dv_release_master] FOREIGN KEY ([release_key]) REFERENCES [dv_release].[dv_release_master] ([release_key]),
    CONSTRAINT [dv_satellite_column_unique] UNIQUE NONCLUSTERED ([satellite_key] ASC, [column_key] ASC),
    CONSTRAINT [dv_satellite_source_column_unique] UNIQUE NONCLUSTERED ([column_key] ASC)
);




GO
