-- phpMyAdmin SQL Dump
-- version 2.11.11.2
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Jeu 23 Avril 2015 à 13:47
-- Version du serveur: 5.0.95
-- Version de PHP: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `asterisk`
--

-- --------------------------------------------------------

--
-- Structure de la table `customcontexts_contexts`
--

DROP TABLE IF EXISTS `customcontexts_contexts`;
CREATE TABLE IF NOT EXISTS `customcontexts_contexts` (
  `context` varchar(100) NOT NULL default '',
  `description` varchar(100) NOT NULL default '',
  `dialrules` varchar(1000) default NULL,
  `faildestination` varchar(250) default NULL,
  `featurefaildestination` varchar(250) default NULL,
  `failpin` varchar(100) default NULL,
  `failpincdr` tinyint(1) NOT NULL default '0',
  `featurefailpin` varchar(100) default NULL,
  `featurefailpincdr` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`context`),
  UNIQUE KEY `description` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `customcontexts_contexts`
--

INSERT INTO `customcontexts_contexts` (`context`, `description`, `dialrules`, `faildestination`, `featurefaildestination`, `failpin`, `failpincdr`, `featurefailpin`, `featurefailpincdr`) VALUES
('Urgence', '5 - Urgence', '9|XXX|*X.|#X.', 'from-internal,${EXTEN},1', '', '2909', 0, '', 0),
('National', '4 - National', '9|XXX|*X.|#X.', '', '', '', 0, '', 0),
('GSM', '3 - GSM', '9|XXX|*X.|#X.', '', '', '', 0, '', 0),
('Speciaux', '2 - Speciaux', '9|XXX|*X.|#X.', '', '', '', 0, '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `customcontexts_contexts_list`
--

DROP TABLE IF EXISTS `customcontexts_contexts_list`;
CREATE TABLE IF NOT EXISTS `customcontexts_contexts_list` (
  `context` varchar(100) NOT NULL default '',
  `description` varchar(100) NOT NULL default '',
  `locked` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`context`),
  UNIQUE KEY `description` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `customcontexts_contexts_list`
--

INSERT INTO `customcontexts_contexts_list` (`context`, `description`, `locked`) VALUES
('from-internal', 'Default Internal Context', 1),
('from-internal-additional', 'Internal Dialplan', 0),
('outbound-allroutes', 'Outbound Routes', 0);

-- --------------------------------------------------------

--
-- Structure de la table `customcontexts_includes`
--

DROP TABLE IF EXISTS `customcontexts_includes`;
CREATE TABLE IF NOT EXISTS `customcontexts_includes` (
  `context` varchar(100) NOT NULL default '',
  `include` varchar(100) NOT NULL default '',
  `timegroupid` int(11) default NULL,
  `sort` int(11) NOT NULL default '0',
  `userules` varchar(10) default NULL,
  PRIMARY KEY  (`context`,`include`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `customcontexts_includes`
--

INSERT INTO `customcontexts_includes` (`context`, `include`, `timegroupid`, `sort`, `userules`) VALUES
('National', 'app-dnd-toggle', NULL, 19, ''),
('National', 'ext-dnd-hints', NULL, 20, ''),
('National', 'ext-queues', NULL, 21, ''),
('National', 'app-fax', NULL, 22, ''),
('National', 'park-hints', NULL, 23, ''),
('National', 'app-recordings', NULL, 24, ''),
('National', 'app-cf-busy-off', NULL, 25, ''),
('National', 'app-cf-busy-off-any', NULL, 26, ''),
('National', 'app-cf-busy-on', NULL, 27, ''),
('National', 'app-cf-busy-prompting-on', NULL, 28, ''),
('National', 'app-cf-off', NULL, 29, ''),
('National', 'app-cf-off-any', NULL, 30, ''),
('National', 'app-cf-on', NULL, 31, ''),
('National', 'app-cf-prompting-on', NULL, 32, ''),
('National', 'app-cf-unavailable-off', NULL, 33, ''),
('National', 'app-cf-unavailable-on', NULL, 34, ''),
('National', 'app-cf-unavailable-prompt-on', NULL, 35, ''),
('National', 'app-cf-toggle', NULL, 36, ''),
('National', 'ext-cf-hints', NULL, 37, ''),
('National', 'app-pbdirectory', NULL, 38, ''),
('National', 'app-fmf-toggle', NULL, 39, ''),
('National', 'ext-findmefollow', NULL, 40, ''),
('National', 'fmgrps', NULL, 41, ''),
('National', 'app-speeddial', NULL, 42, ''),
('National', 'app-userlogonoff', NULL, 43, ''),
('National', 'ext-local-confirm', NULL, 44, ''),
('National', 'findmefollow-ringallv2', NULL, 45, ''),
('National', 'app-pickup', NULL, 46, ''),
('National', 'app-zapbarge', NULL, 47, ''),
('National', 'app-chanspy', NULL, 48, ''),
('National', 'ext-test', NULL, 49, ''),
('National', 'ext-local', NULL, 50, ''),
('National', 'outrt-2', NULL, 101, ''),
('National', 'outrt-3', NULL, 102, ''),
('GSM', 'outrt-3', NULL, 102, ''),
('GSM', 'outrt-4', NULL, 103, ''),
('GSM', 'outrt-2', NULL, 101, ''),
('GSM', 'ext-local', NULL, 50, ''),
('GSM', 'ext-test', NULL, 49, ''),
('GSM', 'app-chanspy', NULL, 48, ''),
('GSM', 'app-zapbarge', NULL, 47, ''),
('GSM', 'app-pickup', NULL, 46, ''),
('GSM', 'findmefollow-ringallv2', NULL, 45, ''),
('GSM', 'ext-local-confirm', NULL, 44, ''),
('GSM', 'app-userlogonoff', NULL, 43, ''),
('GSM', 'app-speeddial', NULL, 42, ''),
('GSM', 'fmgrps', NULL, 41, ''),
('GSM', 'ext-findmefollow', NULL, 40, ''),
('GSM', 'app-fmf-toggle', NULL, 39, ''),
('GSM', 'app-pbdirectory', NULL, 38, ''),
('GSM', 'ext-cf-hints', NULL, 37, ''),
('GSM', 'app-cf-toggle', NULL, 36, ''),
('GSM', 'app-cf-unavailable-prompt-on', NULL, 35, ''),
('GSM', 'app-cf-unavailable-on', NULL, 34, ''),
('GSM', 'app-cf-unavailable-off', NULL, 33, ''),
('GSM', 'app-cf-prompting-on', NULL, 32, ''),
('GSM', 'app-cf-on', NULL, 31, ''),
('GSM', 'app-cf-off-any', NULL, 30, ''),
('GSM', 'app-cf-off', NULL, 29, ''),
('GSM', 'app-cf-busy-prompting-on', NULL, 28, ''),
('GSM', 'app-cf-busy-on', NULL, 27, ''),
('GSM', 'app-cf-busy-off-any', NULL, 26, ''),
('GSM', 'app-cf-busy-off', NULL, 25, ''),
('GSM', 'app-recordings', NULL, 24, ''),
('GSM', 'park-hints', NULL, 23, ''),
('GSM', 'app-fax', NULL, 22, ''),
('GSM', 'ext-queues', NULL, 21, ''),
('GSM', 'ext-dnd-hints', NULL, 20, ''),
('GSM', 'app-dnd-toggle', NULL, 19, ''),
('GSM', 'app-dnd-on', NULL, 18, ''),
('GSM', 'app-dnd-off', NULL, 17, ''),
('GSM', 'ext-meetme', NULL, 16, ''),
('GSM', 'app-gabcast', NULL, 15, ''),
('GSM', 'app-blacklist', NULL, 14, ''),
('GSM', 'vmblast-grp', NULL, 13, ''),
('GSM', 'app-callwaiting-cwon', NULL, 12, ''),
('GSM', 'app-callwaiting-cwoff', NULL, 11, ''),
('GSM', 'app-vmmain', NULL, 10, ''),
('GSM', 'app-dialvm', NULL, 9, ''),
('GSM', 'app-speakingclock', NULL, 8, ''),
('GSM', 'app-speakextennum', NULL, 7, ''),
('GSM', 'app-echo-test', NULL, 6, ''),
('GSM', 'app-calltrace', NULL, 5, ''),
('GSM', 'app-dictate-send', NULL, 4, ''),
('GSM', 'app-dictate-record', NULL, 3, ''),
('GSM', 'grps', NULL, 2, ''),
('GSM', 'ext-group', NULL, 1, ''),
('Speciaux', 'outrt-5', NULL, 104, ''),
('Speciaux', 'outrt-4', NULL, 103, ''),
('Speciaux', 'outrt-3', NULL, 102, ''),
('Speciaux', 'outrt-2', NULL, 101, ''),
('Speciaux', 'ext-local', NULL, 50, ''),
('Speciaux', 'ext-test', NULL, 49, ''),
('Speciaux', 'app-chanspy', NULL, 48, ''),
('Speciaux', 'app-zapbarge', NULL, 47, ''),
('Speciaux', 'app-pickup', NULL, 46, ''),
('Speciaux', 'findmefollow-ringallv2', NULL, 45, ''),
('Speciaux', 'ext-local-confirm', NULL, 44, ''),
('Speciaux', 'app-userlogonoff', NULL, 43, ''),
('Speciaux', 'app-speeddial', NULL, 42, ''),
('Speciaux', 'ext-findmefollow', NULL, 40, ''),
('Speciaux', 'fmgrps', NULL, 41, ''),
('Speciaux', 'app-fmf-toggle', NULL, 39, ''),
('Speciaux', 'app-pbdirectory', NULL, 38, ''),
('Speciaux', 'app-cf-toggle', NULL, 36, ''),
('Speciaux', 'ext-cf-hints', NULL, 37, ''),
('Speciaux', 'app-cf-unavailable-prompt-on', NULL, 35, ''),
('Speciaux', 'app-cf-unavailable-on', NULL, 34, ''),
('Speciaux', 'app-cf-unavailable-off', NULL, 33, ''),
('Speciaux', 'app-cf-prompting-on', NULL, 32, ''),
('Speciaux', 'app-cf-on', NULL, 31, ''),
('Speciaux', 'app-cf-off-any', NULL, 30, ''),
('Speciaux', 'app-cf-busy-off-any', NULL, 26, ''),
('Speciaux', 'app-cf-busy-on', NULL, 27, ''),
('Speciaux', 'app-cf-busy-prompting-on', NULL, 28, ''),
('Speciaux', 'app-cf-off', NULL, 29, ''),
('Speciaux', 'app-cf-busy-off', NULL, 25, ''),
('Speciaux', 'app-recordings', NULL, 24, ''),
('Speciaux', 'park-hints', NULL, 23, ''),
('Speciaux', 'app-fax', NULL, 22, ''),
('Speciaux', 'ext-queues', NULL, 21, ''),
('Speciaux', 'ext-dnd-hints', NULL, 20, ''),
('Speciaux', 'app-dnd-toggle', NULL, 19, ''),
('Speciaux', 'app-dnd-on', NULL, 18, ''),
('Speciaux', 'app-dnd-off', NULL, 17, ''),
('Speciaux', 'ext-meetme', NULL, 16, ''),
('Speciaux', 'app-gabcast', NULL, 15, ''),
('Speciaux', 'app-blacklist', NULL, 14, ''),
('Speciaux', 'vmblast-grp', NULL, 13, ''),
('Speciaux', 'app-callwaiting-cwon', NULL, 12, ''),
('Speciaux', 'app-callwaiting-cwoff', NULL, 11, ''),
('Speciaux', 'app-vmmain', NULL, 10, ''),
('Speciaux', 'app-dialvm', NULL, 9, ''),
('Speciaux', 'app-speakingclock', NULL, 8, ''),
('Speciaux', 'app-speakextennum', NULL, 7, ''),
('Speciaux', 'app-echo-test', NULL, 6, ''),
('Speciaux', 'app-calltrace', NULL, 5, ''),
('Speciaux', 'app-dictate-send', NULL, 4, ''),
('Speciaux', 'app-dictate-record', NULL, 3, ''),
('Speciaux', 'grps', NULL, 2, ''),
('Speciaux', 'ext-group', NULL, 1, ''),
('Speciaux', 'from-internal-additional', NULL, 0, 'allowmatch'),
('Speciaux', 'from-internal-custom', NULL, 0, ''),
('Speciaux', 'parkedcalls', NULL, 0, ''),
('GSM', 'from-internal-additional', NULL, 0, 'allowmatch'),
('GSM', 'from-internal-custom', NULL, 0, ''),
('GSM', 'parkedcalls', NULL, 0, ''),
('National', 'app-dnd-on', NULL, 18, ''),
('National', 'app-dnd-off', NULL, 17, ''),
('National', 'ext-meetme', NULL, 16, ''),
('National', 'app-gabcast', NULL, 15, ''),
('National', 'app-blacklist', NULL, 14, ''),
('National', 'vmblast-grp', NULL, 13, ''),
('National', 'ext-group', NULL, 1, ''),
('National', 'grps', NULL, 2, ''),
('National', 'app-dictate-record', NULL, 3, ''),
('National', 'app-dictate-send', NULL, 4, ''),
('National', 'app-calltrace', NULL, 5, ''),
('National', 'app-echo-test', NULL, 6, ''),
('National', 'app-speakextennum', NULL, 7, ''),
('National', 'app-speakingclock', NULL, 8, ''),
('National', 'app-dialvm', NULL, 9, ''),
('National', 'app-vmmain', NULL, 10, ''),
('National', 'app-callwaiting-cwoff', NULL, 11, ''),
('National', 'app-callwaiting-cwon', NULL, 12, ''),
('Urgence', 'outrt-2', NULL, 101, ''),
('Urgence', 'ext-local', NULL, 50, ''),
('Urgence', 'ext-test', NULL, 49, ''),
('Urgence', 'app-chanspy', NULL, 48, ''),
('Urgence', 'app-zapbarge', NULL, 47, ''),
('Urgence', 'app-pickup', NULL, 46, ''),
('Urgence', 'findmefollow-ringallv2', NULL, 45, ''),
('Urgence', 'ext-local-confirm', NULL, 44, ''),
('Urgence', 'app-userlogonoff', NULL, 43, ''),
('Urgence', 'app-speeddial', NULL, 42, ''),
('Urgence', 'fmgrps', NULL, 41, ''),
('Urgence', 'ext-findmefollow', NULL, 40, ''),
('Urgence', 'app-fmf-toggle', NULL, 39, ''),
('Urgence', 'app-pbdirectory', NULL, 38, ''),
('Urgence', 'ext-cf-hints', NULL, 37, ''),
('Urgence', 'app-cf-toggle', NULL, 36, ''),
('Urgence', 'app-cf-unavailable-prompt-on', NULL, 35, ''),
('Urgence', 'app-cf-unavailable-on', NULL, 34, ''),
('Urgence', 'app-cf-unavailable-off', NULL, 33, ''),
('Urgence', 'app-cf-prompting-on', NULL, 32, ''),
('Urgence', 'app-cf-on', NULL, 31, ''),
('Urgence', 'app-cf-off-any', NULL, 30, ''),
('Urgence', 'app-cf-off', NULL, 29, ''),
('Urgence', 'app-cf-busy-prompting-on', NULL, 28, ''),
('Urgence', 'app-cf-busy-on', NULL, 27, ''),
('Urgence', 'app-cf-busy-off-any', NULL, 26, ''),
('Urgence', 'app-cf-busy-off', NULL, 25, ''),
('Urgence', 'app-recordings', NULL, 24, ''),
('Urgence', 'park-hints', NULL, 23, ''),
('Urgence', 'app-fax', NULL, 22, ''),
('Urgence', 'ext-dnd-hints', NULL, 20, ''),
('Urgence', 'ext-queues', NULL, 21, ''),
('Urgence', 'app-dnd-toggle', NULL, 19, ''),
('Urgence', 'app-dnd-on', NULL, 18, ''),
('Urgence', 'app-dnd-off', NULL, 17, ''),
('Urgence', 'ext-meetme', NULL, 16, ''),
('Urgence', 'app-gabcast', NULL, 15, ''),
('National', 'from-internal-additional', NULL, 0, 'allowmatch'),
('National', 'from-internal-custom', NULL, 0, ''),
('National', 'parkedcalls', NULL, 0, ''),
('Urgence', 'app-blacklist', NULL, 14, ''),
('Urgence', 'vmblast-grp', NULL, 13, ''),
('Urgence', 'app-callwaiting-cwon', NULL, 12, ''),
('Urgence', 'app-callwaiting-cwoff', NULL, 11, ''),
('Urgence', 'app-vmmain', NULL, 10, ''),
('Urgence', 'app-dialvm', NULL, 9, ''),
('Urgence', 'app-speakingclock', NULL, 8, ''),
('Urgence', 'app-speakextennum', NULL, 7, ''),
('Urgence', 'app-echo-test', NULL, 6, ''),
('Urgence', 'app-calltrace', NULL, 5, ''),
('Urgence', 'app-dictate-send', NULL, 4, ''),
('Urgence', 'app-dictate-record', NULL, 3, ''),
('Urgence', 'grps', NULL, 2, ''),
('Urgence', 'ext-group', NULL, 1, ''),
('Urgence', 'from-internal-additional', NULL, 0, 'allowmatch'),
('Urgence', 'from-internal-custom', NULL, 0, ''),
('Urgence', 'parkedcalls', NULL, 0, '');

-- --------------------------------------------------------

--
-- Structure de la table `customcontexts_includes_list`
--

DROP TABLE IF EXISTS `customcontexts_includes_list`;
CREATE TABLE IF NOT EXISTS `customcontexts_includes_list` (
  `context` varchar(100) NOT NULL default '',
  `include` varchar(100) NOT NULL default '',
  `description` varchar(100) NOT NULL default '',
  `missing` tinyint(1) NOT NULL default '0',
  `sort` int(11) NOT NULL default '0',
  PRIMARY KEY  (`context`,`include`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `customcontexts_includes_list`
--

INSERT INTO `customcontexts_includes_list` (`context`, `include`, `description`, `missing`, `sort`) VALUES
('from-internal', 'parkedcalls', 'Call Parking', 0, 0),
('from-internal', 'from-internal-custom', 'Custom Internal Dialplan', 0, 0),
('from-internal-additional', 'outbound-allroutes', 'ALL OUTBOUND ROUTES', 0, 53),
('from-internal', 'from-internal-additional', 'ENTIRE Basic Internal Dialplan', 0, 0),
('from-internal-additional', 'ext-group', 'ext-group', 0, 1),
('from-internal-additional', 'grps', 'grps', 0, 2),
('from-internal-additional', 'app-dictate-record', 'app-dictate-record', 0, 3),
('from-internal-additional', 'app-dictate-send', 'app-dictate-send', 0, 4),
('from-internal-additional', 'app-calltrace', 'app-calltrace', 0, 5),
('from-internal-additional', 'app-echo-test', 'app-echo-test', 0, 6),
('from-internal-additional', 'app-speakextennum', 'app-speakextennum', 0, 7),
('from-internal-additional', 'app-speakingclock', 'app-speakingclock', 0, 8),
('from-internal-additional', 'app-dialvm', 'app-dialvm', 0, 9),
('from-internal-additional', 'app-vmmain', 'app-vmmain', 0, 10),
('from-internal-additional', 'app-callwaiting-cwoff', 'app-callwaiting-cwoff', 0, 11),
('from-internal-additional', 'app-callwaiting-cwon', 'app-callwaiting-cwon', 0, 12),
('from-internal-additional', 'vmblast-grp', 'vmblast-grp', 0, 13),
('from-internal-additional', 'app-blacklist', 'app-blacklist', 0, 14),
('from-internal-additional', 'app-gabcast', 'app-gabcast', 0, 15),
('from-internal-additional', 'ext-meetme', 'ext-meetme', 0, 16),
('from-internal-additional', 'app-dnd-off', 'app-dnd-off', 0, 17),
('from-internal-additional', 'app-dnd-on', 'app-dnd-on', 0, 18),
('from-internal-additional', 'app-dnd-toggle', 'app-dnd-toggle', 0, 19),
('from-internal-additional', 'ext-dnd-hints', 'ext-dnd-hints', 0, 20),
('from-internal-additional', 'ext-queues', 'ext-queues', 0, 21),
('from-internal-additional', 'app-fax', 'app-fax', 0, 24),
('from-internal-additional', 'park-hints', 'park-hints', 0, 25),
('from-internal-additional', 'app-recordings', 'app-recordings', 0, 26),
('from-internal-additional', 'app-cf-busy-off', 'app-cf-busy-off', 0, 27),
('from-internal-additional', 'app-cf-busy-off-any', 'app-cf-busy-off-any', 0, 28),
('from-internal-additional', 'app-cf-busy-on', 'app-cf-busy-on', 0, 29),
('from-internal-additional', 'app-cf-busy-prompting-on', 'app-cf-busy-prompting-on', 0, 30),
('from-internal-additional', 'app-cf-off', 'app-cf-off', 0, 31),
('from-internal-additional', 'app-cf-off-any', 'app-cf-off-any', 0, 32),
('from-internal-additional', 'app-cf-on', 'app-cf-on', 0, 33),
('from-internal-additional', 'app-cf-prompting-on', 'app-cf-prompting-on', 0, 34),
('from-internal-additional', 'app-cf-unavailable-off', 'app-cf-unavailable-off', 0, 35),
('from-internal-additional', 'app-cf-unavailable-on', 'app-cf-unavailable-on', 0, 36),
('from-internal-additional', 'app-cf-unavailable-prompt-on', 'app-cf-unavailable-prompt-on', 0, 37),
('from-internal-additional', 'app-cf-toggle', 'app-cf-toggle', 0, 38),
('from-internal-additional', 'ext-cf-hints', 'ext-cf-hints', 0, 39),
('from-internal-additional', 'app-pbdirectory', 'app-pbdirectory', 0, 40),
('from-internal-additional', 'app-fmf-toggle', 'app-fmf-toggle', 0, 41),
('from-internal-additional', 'ext-findmefollow', 'ext-findmefollow', 0, 42),
('from-internal-additional', 'fmgrps', 'fmgrps', 0, 43),
('from-internal-additional', 'app-speeddial', 'app-speeddial', 0, 44),
('from-internal-additional', 'app-userlogonoff', 'app-userlogonoff', 0, 45),
('from-internal-additional', 'ext-local-confirm', 'ext-local-confirm', 0, 46),
('from-internal-additional', 'findmefollow-ringallv2', 'findmefollow-ringallv2', 0, 47),
('from-internal-additional', 'app-pickup', 'app-pickup', 0, 48),
('from-internal-additional', 'app-zapbarge', 'app-zapbarge', 0, 49),
('from-internal-additional', 'app-chanspy', 'app-chanspy', 0, 50),
('from-internal-additional', 'ext-test', 'ext-test', 0, 51),
('from-internal-additional', 'ext-local', 'ext-local', 0, 52),
('outbound-allroutes', 'outrt-2', 'Urgence', 0, 101),
('outbound-allroutes', 'outrt-3', 'National', 0, 102),
('outbound-allroutes', 'outrt-4', 'GSM', 0, 103),
('outbound-allroutes', 'outrt-5', 'Speciaux', 0, 104),
('outbound-allroutes', 'outrt-6', 'International', 0, 105),
('from-internal-additional', 'app-queue-toggle', 'app-queue-toggle', 0, 22),
('from-internal-additional', 'app-queue-caller-count', 'app-queue-caller-count', 0, 23);

-- --------------------------------------------------------

--
-- Structure de la table `customcontexts_module`
--

DROP TABLE IF EXISTS `customcontexts_module`;
CREATE TABLE IF NOT EXISTS `customcontexts_module` (
  `id` varchar(50) NOT NULL default '',
  `value` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `customcontexts_module`
--

INSERT INTO `customcontexts_module` (`id`, `value`) VALUES
('modulerawname', 'customcontexts'),
('moduledisplayname', 'Custom Contexts'),
('moduleversion', '0.3.2'),
('displaysortforincludes', '1');
