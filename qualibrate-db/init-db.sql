INSERT INTO `companies` (`id`,`bpm_connection_string`,`bpm_deployment_id`,`bpm_project`,`css`,`description`,`name`,`smtp_password`,`smtp_properties`,`smtp_reply_to_email`,`smtp_sender_email`,`smtp_username`,`status`,`adapter_actions`,`ux_accelerators`,`toolbox_configuration`) VALUES (1,' ',' ',' ',' ','1st company on server','Company0','password','test=tes;new_prop_name=value;new_prop_name=v','admin@qualibrate.com','qualibrate@iovio.com','mail.user','ACTIVE','1;ExecuteSchedule;SCHEDULE;EXECUTIONPLAN;{scheduleId}\n5;ExecuteManualTest;EXECUTE;\\QFPManualTester\\QFPManualTester.exe;{bfId} {iterationId}\n6;ExecuteInteractiveTraining;EXECUTE;\\QFPManualTester\\QFPManualTester.exe;{bfId} {iterationId} TRUE\n2;ExecuteAutomatedTest;EXECUTE;\\QFPAutomatedTester\\QFPAutomatedTester.exe;{bfId} {iterationId}\n3;Record;EXECUTE;\\QFPRecorder\\QFPRecorder.exe;{bfId}\n7;RecordFromStep;EXECUTE;\\QFPRecorder\\QFPRecorder.exe;{bfId} {btIId} {taIId}\n4;ExecuteTraining;EXECUTE;\\QFPTrainer\\QFPTrainer.exe;{bfId} {iterationId}\n8;ExecuteScenarioBatch;SCHEDULE;SCENARIOBATCH;{folderId}','Adapter=/opt/qfp_data/accelerators/2/QFPAdapterSetup.msi\nQFPRecorder=/opt/qfp_data/accelerators/2/QFPRecorderSetup.msi\nQFPManualTester=/opt/qfp_data/accelerators/2/QFPManualTesterSetup.msi\nQFPAutomatedTester=/opt/qfp_data/accelerators/2/QFPAutomatedTesterSetup.msi\nQFPTrainer=/opt/qfp_data/accelerators/2/QFPTrainerSetup.msi','<?xml version="1.0" encoding="utf-8"?><configuration><technology name="Windows" objectTypeProperty="tagName"><general><actions><action name="Click"/></actions></general></technology></configuration>');

INSERT INTO `profiles` (`id`,`email`,`first_name`,`last_name`,`mobile`,`phone`,`position`,`timezone`,`user_id`) VALUES (1,'admin@qualibrate.com','System','Admin','+40729168909','+40','Qualibrate Administrator',7200000,1);

INSERT INTO `users` (`id`,`username`,`password`,`company_id`,`secret`,`role`,`status`,`last_password_change`) VALUES (1,'admin','v8kS+KHRSLwK7r1RIu+2mg==',1,'','QFP-Administrators','ACTIVE',147658386840800);

INSERT INTO `projects` (`id`, `company_id`, `name`, `status`, `description`, `icon`) VALUES(1, 1, '1st Project', 'ACTIVE', '1st Project description...', 'forumbee');

INSERT INTO `project_groups` (`id`, `name`, `description`, `status`, `project_id`) VALUES(1, 'Administrators', 'Administrators group', 'ACTIVE', 1);

INSERT INTO `project_user_groups` (`id`, `group_id`, `user_id`) VALUES (1, 1, 1);

INSERT INTO `modules` (`id`, `description`, `icon`, `name`, `project_id`, `index`, `template`, `label`) VALUES ('1', '', 'fa-tachometer', 'bi & reporting', '1', '2', '', 'Dashboards');
INSERT INTO `modules` (`id`, `description`, `icon`, `name`, `project_id`, `index`, `template`, `label`) VALUES ('2', '', 'fa-bug', 'defects management', '1', '4', '', 'Defects');
INSERT INTO `modules` (`id`, `description`, `icon`, `name`, `project_id`, `index`, `template`, `label`) VALUES ('3', '', 'fa-tasks', 'solution testing', '1', '1', '', 'Testing');
INSERT INTO `modules` (`id`, `description`, `icon`, `name`, `project_id`, `index`, `template`, `label`) VALUES ('4', '', 'fa-flask', 'solution design', '1', '3', '', 'Design');
INSERT INTO `modules` (`id`, `description`, `icon`, `name`, `project_id`, `index`, `template`, `label`) VALUES ('5', '', 'fa-bug', '', '1', '5', '', 'Defects - new');

INSERT INTO `project_permissions` (`id`,`entity_id`,`name`,`permission_type`,`project_id`,`user_action`) VALUES ('1', '4', 'solution design-WRITE', 'MODULE_WRITE', '1', '');
INSERT INTO `project_permissions` (`id`,`entity_id`,`name`,`permission_type`,`project_id`,`user_action`) VALUES ('2', '4', 'solution design-READ', 'MODULE_READ', '1', '');
INSERT INTO `project_permissions` (`id`,`entity_id`,`name`,`permission_type`,`project_id`,`user_action`) VALUES ('3', '3', 'solution testing-WRITE', 'MODULE_WRITE', '1', '');
INSERT INTO `project_permissions` (`id`,`entity_id`,`name`,`permission_type`,`project_id`,`user_action`) VALUES ('4', '3', 'solution testing-READ', 'MODULE_READ', '1', '');
INSERT INTO `project_permissions` (`id`,`entity_id`,`name`,`permission_type`,`project_id`,`user_action`) VALUES ('5', '2', 'defects management-WRITE', 'MODULE_WRITE', '1', '');
INSERT INTO `project_permissions` (`id`,`entity_id`,`name`,`permission_type`,`project_id`,`user_action`) VALUES ('6', '2', 'defects management-READ', 'MODULE_READ', '1', '');
INSERT INTO `project_permissions` (`id`,`entity_id`,`name`,`permission_type`,`project_id`,`user_action`) VALUES ('7', '5', 'defects management new-WRITE', 'MODULE_WRITE', '1', '');
INSERT INTO `project_permissions` (`id`,`entity_id`,`name`,`permission_type`,`project_id`,`user_action`) VALUES ('8', '5', 'defects management new-READ', 'MODULE_READ', '1', '');
INSERT INTO `project_permissions` (`id`,`entity_id`,`name`,`permission_type`,`project_id`,`user_action`) VALUES ('9', '1', 'bi & reporting-WRITE', 'MODULE_WRITE', '1', '');
INSERT INTO `project_permissions` (`id`,`entity_id`,`name`,`permission_type`,`project_id`,`user_action`) VALUES ('10', '1', 'bi & reporting-READ', 'MODULE_READ', '1', '');
INSERT INTO `project_permissions` (`id`,`entity_id`,`name`,`permission_type`,`project_id`,`user_action`) VALUES ('11', '1', 'bi & reporting-SimpleAssetsPaste', 'MODULE_USERACTION', '1', 'SimpleAssetsPaste');

INSERT INTO `project_group_permissions` (`id`,`group_id`,`permission_id`) VALUES ('1', '1', '1');
INSERT INTO `project_group_permissions` (`id`,`group_id`,`permission_id`) VALUES ('2', '1', '2');
INSERT INTO `project_group_permissions` (`id`,`group_id`,`permission_id`) VALUES ('3', '1', '3');
INSERT INTO `project_group_permissions` (`id`,`group_id`,`permission_id`) VALUES ('4', '1', '4');
INSERT INTO `project_group_permissions` (`id`,`group_id`,`permission_id`) VALUES ('5', '1', '5');
INSERT INTO `project_group_permissions` (`id`,`group_id`,`permission_id`) VALUES ('6', '1', '6');
INSERT INTO `project_group_permissions` (`id`,`group_id`,`permission_id`) VALUES ('7', '1', '7');
INSERT INTO `project_group_permissions` (`id`,`group_id`,`permission_id`) VALUES ('8', '1', '8');
INSERT INTO `project_group_permissions` (`id`,`group_id`,`permission_id`) VALUES ('9', '1', '9');
INSERT INTO `project_group_permissions` (`id`,`group_id`,`permission_id`) VALUES ('10', '1', '10');
INSERT INTO `project_group_permissions` (`id`,`group_id`,`permission_id`) VALUES ('11', '1', '11');

INSERT INTO `accelerators`(`id`,`company_id`,`accelerator_file_name`,`accelerator_name`,`last_upgrade_responsible_id`,`last_upgrade_time`,`version`,`executable_file_name`,`installation_path`) VALUES ('1', '1', '', 'Adapter', '0', '0', '2.0.6105.22853', 'QFPAdapter.exe', '');
INSERT INTO `accelerators`(`id`,`company_id`,`accelerator_file_name`,`accelerator_name`,`last_upgrade_responsible_id`,`last_upgrade_time`,`version`,`executable_file_name`,`installation_path`) VALUES ('2', '1', '', 'QFPAutomatedTester', '0', '0', '2.0.6106.42767', 'QFPAutomatedTester.exe', 'Adapter');
INSERT INTO `accelerators`(`id`,`company_id`,`accelerator_file_name`,`accelerator_name`,`last_upgrade_responsible_id`,`last_upgrade_time`,`version`,`executable_file_name`,`installation_path`) VALUES ('3', '1', '', 'QFPManualTester', '0', '0', '2.0.6106.42771', 'QFPManualTester.exe', 'Adapter');
INSERT INTO `accelerators`(`id`,`company_id`,`accelerator_file_name`,`accelerator_name`,`last_upgrade_responsible_id`,`last_upgrade_time`,`version`,`executable_file_name`,`installation_path`) VALUES ('4', '1', '', 'QFPRecorder', '0', '0', '2.0.6106.42773', 'QFPRecorder.exe', 'Adapter');
INSERT INTO `accelerators`(`id`,`company_id`,`accelerator_file_name`,`accelerator_name`,`last_upgrade_responsible_id`,`last_upgrade_time`,`version`,`executable_file_name`,`installation_path`) VALUES ('5', '1', '', 'QFPTrainer', '0', '0', '2.0.6105.22874', 'QFPTrainer.exe', 'Adapter');
INSERT INTO `accelerators`(`id`,`company_id`,`accelerator_file_name`,`accelerator_name`,`last_upgrade_responsible_id`,`last_upgrade_time`,`version`,`executable_file_name`,`installation_path`) VALUES ('6', '1', '', 'QualibrateUpdater', '0', '0', '2.0.6105.22879', '', '');
INSERT INTO `accelerators`(`id`,`company_id`,`accelerator_file_name`,`accelerator_name`,`last_upgrade_responsible_id`,`last_upgrade_time`,`version`,`executable_file_name`,`installation_path`) VALUES ('7', '1', '', 'QFPCli', '0', '0', '', 'qfpcli.exe', 'Utils');

