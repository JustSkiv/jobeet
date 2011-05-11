-- phpMyAdmin SQL Dump
-- version 3.3.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 10 2011 г., 02:15
-- Версия сервера: 5.1.56
-- Версия PHP: 5.3.6-10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- База данных: `jobeet`
--

-- --------------------------------------------------------

--
-- Структура таблицы `jobeet_affiliate`
--

CREATE TABLE IF NOT EXISTS `jobeet_affiliate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `jobeet_affiliate`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jobeet_category`
--

CREATE TABLE IF NOT EXISTS `jobeet_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `jobeet_category`
--

INSERT INTO `jobeet_category` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Design', '2011-05-10 02:13:46', '2011-05-10 02:13:46'),
(2, 'Programming', '2011-05-10 02:13:46', '2011-05-10 02:13:46'),
(3, 'Manager', '2011-05-10 02:13:46', '2011-05-10 02:13:46'),
(4, 'Administrator', '2011-05-10 02:13:46', '2011-05-10 02:13:46');

-- --------------------------------------------------------

--
-- Структура таблицы `jobeet_category_affiliate`
--

CREATE TABLE IF NOT EXISTS `jobeet_category_affiliate` (
  `category_id` bigint(20) NOT NULL DEFAULT '0',
  `affiliate_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`,`affiliate_id`),
  KEY `jobeet_category_affiliate_affiliate_id_jobeet_affiliate_id` (`affiliate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `jobeet_category_affiliate`
--


-- --------------------------------------------------------

--
-- Структура таблицы `jobeet_job`
--

CREATE TABLE IF NOT EXISTS `jobeet_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `company` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `position` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `how_to_apply` text NOT NULL,
  `token` varchar(255) NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `category_id_idx` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `jobeet_job`
--

INSERT INTO `jobeet_job` (`id`, `category_id`, `type`, `company`, `logo`, `url`, `position`, `location`, `description`, `how_to_apply`, `token`, `is_public`, `is_activated`, `email`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'full-time', 'Sensio Labs', '/uploads/jobs/sensio_labs.png', 'http://www.sensiolabs.com/', 'Web Developer', 'Paris, France', 'You''ve already developed websites with symfony and you want to work\nwith Open-Source technologies. You have a minimum of 3 years\nexperience in web development with PHP or Java and you wish to\nparticipate to development of Web 2.0 sites using the best\nframeworks available.\n', 'Send your resume to fabien.potencier [at] sensio.com\n', 'job_sensio_labs', 1, 1, 'job@example.com', '2008-10-10 00:00:00', '2011-05-10 02:13:46', '2011-05-10 02:13:46'),
(2, 1, 'part-time', 'Extreme Sensio', '/uploads/jobs/extreme_sensio.png', 'http://www.extreme-sensio.com/', 'Web Designer', 'Paris, France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\neiusmod tempor incididunt ut labore et dolore magna aliqua. Ut\nenim ad minim veniam, quis nostrud exercitation ullamco laboris\nnisi ut aliquip ex ea commodo consequat. Duis aute irure dolor\nin reprehenderit in.\n\nVoluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa\nqui officia deserunt mollit anim id est laborum.\n', 'Send your resume to fabien.potencier [at] sensio.com\n', 'job_extreme_sensio', 1, 1, 'job@example.com', '2008-10-10 00:00:00', '2011-05-10 02:13:46', '2011-05-10 02:13:46');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `jobeet_category_affiliate`
--
ALTER TABLE `jobeet_category_affiliate`
  ADD CONSTRAINT `jobeet_category_affiliate_affiliate_id_jobeet_affiliate_id` FOREIGN KEY (`affiliate_id`) REFERENCES `jobeet_affiliate` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jobeet_category_affiliate_category_id_jobeet_category_id` FOREIGN KEY (`category_id`) REFERENCES `jobeet_category` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `jobeet_job`
--
ALTER TABLE `jobeet_job`
  ADD CONSTRAINT `jobeet_job_category_id_jobeet_category_id` FOREIGN KEY (`category_id`) REFERENCES `jobeet_category` (`id`) ON DELETE CASCADE;

