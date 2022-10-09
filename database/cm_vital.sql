-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2022 a las 15:38:39
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cm_vital`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accountants`
--

CREATE TABLE `accountants` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `type`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Consulta', 2, NULL, 1, '2022-09-22 22:21:53', '2022-09-22 22:21:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `owner_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `addresses`
--

INSERT INTO `addresses` (`id`, `owner_id`, `owner_type`, `address1`, `address2`, `city`, `zip`, `created_at`, `updated_at`) VALUES
(1, 1, 'App\\Models\\Doctor', 'Avenida Tinku N° 323', NULL, 'Potosí', NULL, '2022-09-11 21:51:49', '2022-09-11 21:51:49'),
(2, 1, 'App\\Models\\Patient', 'Avenida Tinku N° 323', NULL, 'Potosí', NULL, '2022-09-12 18:40:39', '2022-09-12 18:40:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `advanced_payments`
--

CREATE TABLE `advanced_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `receipt_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambulances`
--

CREATE TABLE `ambulances` (
  `id` int(10) UNSIGNED NOT NULL,
  `vehicle_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_made` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_license` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_contact` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `vehicle_type` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambulance_calls`
--

CREATE TABLE `ambulance_calls` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `ambulance_id` int(10) UNSIGNED NOT NULL,
  `driver_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `opd_date` datetime NOT NULL,
  `problem` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `appointments`
--

INSERT INTO `appointments` (`id`, `patient_id`, `doctor_id`, `department_id`, `opd_date`, `problem`, `is_completed`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2022-09-29 14:19:00', NULL, 1, '2022-09-29 17:39:31', '2022-09-29 17:39:31'),
(2, 1, 1, 1, '2022-09-29 14:53:00', NULL, 0, '2022-09-29 18:34:16', '2022-09-29 18:34:16'),
(3, 1, 1, 1, '2022-09-29 15:00:00', NULL, 0, '2022-09-29 18:40:09', '2022-09-29 18:40:09'),
(4, 6, 1, 1, '2022-10-04 17:22:00', NULL, 1, '2022-10-04 21:03:06', '2022-10-04 21:03:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beds`
--

CREATE TABLE `beds` (
  `id` int(10) UNSIGNED NOT NULL,
  `bed_type` int(10) UNSIGNED NOT NULL,
  `bed_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bed_assigns`
--

CREATE TABLE `bed_assigns` (
  `id` int(10) UNSIGNED NOT NULL,
  `bed_id` int(10) UNSIGNED NOT NULL,
  `ipd_patient_department_id` int(10) UNSIGNED DEFAULT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `case_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assign_date` datetime NOT NULL,
  `discharge_date` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bed_types`
--

CREATE TABLE `bed_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `bill_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `bill_date` datetime NOT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `patient_admission_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bill_items`
--

CREATE TABLE `bill_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_id` int(10) UNSIGNED NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `birth_reports`
--

CREATE TABLE `birth_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `case_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `birth_reports`
--

INSERT INTO `birth_reports` (`id`, `patient_id`, `case_id`, `doctor_id`, `date`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'IDAKVCXG', 1, '2022-10-05 10:00:00', 'xss', '2022-10-05 14:18:58', '2022-10-05 14:18:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blood_banks`
--

CREATE TABLE `blood_banks` (
  `id` int(10) UNSIGNED NOT NULL,
  `blood_group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remained_bags` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `blood_banks`
--

INSERT INTO `blood_banks` (`id`, `blood_group`, `remained_bags`, `created_at`, `updated_at`) VALUES
(1, 'A+', 1, '2022-09-11 23:42:54', '2022-09-11 23:42:54'),
(2, 'A-', 1, '2022-09-11 23:43:13', '2022-09-11 23:43:13'),
(3, 'B+', 1, '2022-09-11 23:43:29', '2022-09-11 23:43:29'),
(4, 'B-', 1, '2022-09-11 23:43:46', '2022-09-11 23:43:46'),
(5, 'AB+', 1, '2022-09-11 23:44:03', '2022-09-11 23:44:03'),
(6, 'AB-', 1, '2022-09-11 23:44:49', '2022-09-11 23:44:49'),
(7, 'O+', 1, '2022-09-11 23:45:17', '2022-09-11 23:45:17'),
(8, 'O-', 1, '2022-09-11 23:45:27', '2022-09-11 23:45:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blood_donations`
--

CREATE TABLE `blood_donations` (
  `id` int(10) UNSIGNED NOT NULL,
  `blood_donor_id` int(10) UNSIGNED NOT NULL,
  `bags` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blood_donors`
--

CREATE TABLE `blood_donors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `blood_group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_donate_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blood_issues`
--

CREATE TABLE `blood_issues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `issue_date` datetime NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `donor_id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `name`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Bagó', NULL, NULL, '2022-09-26 22:29:48', '2022-10-04 14:10:05'),
(2, 'Vita', NULL, NULL, '2022-10-04 14:10:28', '2022-10-04 14:10:28'),
(3, 'Ifarbo', NULL, NULL, '2022-10-04 14:10:45', '2022-10-04 14:11:07'),
(4, 'Delta', NULL, NULL, '2022-10-04 14:11:20', '2022-10-04 14:11:20'),
(5, 'Minerva', NULL, NULL, '2022-10-04 14:11:39', '2022-10-04 14:11:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `call_logs`
--

CREATE TABLE `call_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `follow_up_date` date DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `call_type` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `case_handlers`
--

CREATE TABLE `case_handlers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'dscd', 1, '2022-09-26 22:16:57', '2022-09-26 22:16:57'),
(2, 'Desinflamantes', 1, '2022-09-30 23:15:05', '2022-09-30 23:15:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `charges`
--

CREATE TABLE `charges` (
  `id` int(10) UNSIGNED NOT NULL,
  `charge_type` int(11) NOT NULL,
  `charge_category_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `standard_charge` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `charge_categories`
--

CREATE TABLE `charge_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_type` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `death_reports`
--

CREATE TABLE `death_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `case_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `death_reports`
--

INSERT INTO `death_reports` (`id`, `patient_id`, `case_id`, `doctor_id`, `date`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'IDAKVCXG', 1, '2022-10-05 10:00:00', 'btgb', '2022-10-05 14:35:06', '2022-10-05 14:35:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`id`, `name`, `is_active`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 1, 'web', '2021-11-17 07:01:21', '2021-11-17 07:01:21'),
(2, 'Doctor', 1, 'web', '2021-11-17 07:01:21', '2021-11-17 07:01:21'),
(3, 'Patient', 1, 'web', '2021-11-17 07:01:21', '2021-11-17 07:01:21'),
(4, 'Nurse', 1, 'web', '2021-11-17 07:01:21', '2021-11-17 07:01:21'),
(5, 'Receptionist', 1, 'web', '2021-11-17 07:01:21', '2021-11-17 07:01:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnosis_categories`
--

CREATE TABLE `diagnosis_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `diagnosis_categories`
--

INSERT INTO `diagnosis_categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Chequeo Ginecológico', NULL, '2022-09-13 18:18:04', '2022-10-06 00:40:21'),
(3, 'Chequeo Cardiólogo', NULL, '2022-10-06 00:40:47', '2022-10-06 00:40:47'),
(4, 'Chequeo Dermatológico', NULL, '2022-10-06 00:41:05', '2022-10-06 00:41:05'),
(5, 'Chequeo Digestivo', NULL, '2022-10-06 00:41:27', '2022-10-06 00:41:27'),
(6, 'Chequeo Urológico', NULL, '2022-10-06 00:41:38', '2022-10-06 00:41:38'),
(7, 'PCR para viajar', NULL, '2022-10-06 00:41:54', '2022-10-06 00:41:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_department_id` bigint(20) UNSIGNED NOT NULL,
  `specialist` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `doctors`
--

INSERT INTO `doctors` (`id`, `user_id`, `doctor_department_id`, `specialist`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Médico General', '2022-09-11 21:51:49', '2022-09-11 21:51:49'),
(2, 7, 9, 'Cirujano', '2022-09-13 22:55:02', '2022-09-23 16:13:40'),
(3, 11, 6, 'Ginecóloga', '2022-09-23 16:15:32', '2022-09-23 16:15:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor_departments`
--

CREATE TABLE `doctor_departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `doctor_departments`
--

INSERT INTO `doctor_departments` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Medicina General', 'Prevención, detección, tratamiento y seguimiento de las enfermedades crónicas estabilizadas.', '2022-09-11 21:02:54', '2022-09-11 21:02:54'),
(2, 'Traumatología', 'Análisis, diagnóstico, tratamiento y seguimiento de dolencias adquiridas por el sistema músculo-esquelético.', '2022-09-11 21:04:11', '2022-09-11 21:04:11'),
(3, 'Neurología', 'Estudio del sistema nervioso, y de las enfermedades del cerebro, la médula, los nervios periféricos y los músculos.', '2022-09-11 21:06:03', '2022-09-11 21:06:03'),
(4, 'Reumatología', 'Prevenir, diagnosticar y tratar las enfermedades musculoesqueléticas y autoinmunes sistémicas.', '2022-09-11 21:06:41', '2022-09-11 21:06:41'),
(5, 'Endocrinología', 'Estudio de la síntesis, secreción, función hormonal, y de los mecanismos de regulación de la secreción hormonal.', '2022-09-11 21:07:10', '2022-09-11 21:07:29'),
(6, 'Ginecología', 'Patologías relacionadas con los órganos femeninos como el útero, la vagina y los ovarios.', '2022-09-11 21:08:00', '2022-09-11 21:08:00'),
(7, 'Neumología', 'Estudio de la fisiología y la patología del aparato respiratorio, así como de las técnicas diagnósticas, terapéuticas y preventivas necesarias.', '2022-09-11 21:08:34', '2022-09-11 21:08:34'),
(8, 'Medicina Interna', 'Atención global al enfermo, asumiendo la completa responsabilidad de la misma, de una forma continua desde la consulta externa a las unidades de internación.', '2022-09-11 21:09:57', '2022-09-11 21:09:57'),
(9, 'Cirugía General', 'Procedimientos quirúrgicos tanto electivos como de urgencia, en los siguientes aparatos: digestivo, endocrino, mama, piel y partes blandas, pared abdominal y retroperitoneo.', '2022-09-11 21:10:45', '2022-09-11 21:10:45'),
(10, 'Pediatría', 'Rama de la medicina que involucra la atención médica de bebes, niños y adolescentes.', '2022-09-11 21:11:17', '2022-09-11 21:11:17'),
(11, 'Dermatología', 'Estudio, conocimiento, diagnóstico y tratamiento de todas aquellas patologías o afecciones de la piel.', '2022-09-11 21:11:48', '2022-09-11 21:11:48'),
(12, 'Odontología', 'Ciencia de la salud que se centra en el diagnóstico, tratamiento y prevención de las enfermedades de la cavidad bucal.', '2022-09-11 21:12:39', '2022-09-11 21:12:39'),
(13, 'Salud Integral', 'Equilibrio entre los factores físicos, biológicos, emocionales, mentales, espirituales y sociales, que permiten un adecuado crecimiento y desarrollo en todos los ámbitos de la vida.', '2022-09-11 21:13:10', '2022-09-11 21:13:10'),
(14, 'Salud Sexual y Reproductiva', 'Estado de completo bienestar físico, mental y social que debe prevalecer durante las etapas preconcepcional, prenatal, parto y puerperio.', '2022-09-11 21:13:48', '2022-09-11 21:13:48'),
(15, 'xsxx', 'dcd', '2022-10-05 13:31:39', '2022-10-05 13:33:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor_opd_charges`
--

CREATE TABLE `doctor_opd_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `standard_charge` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `uploaded_by` bigint(20) UNSIGNED NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `documents`
--

INSERT INTO `documents` (`id`, `title`, `document_type_id`, `patient_id`, `uploaded_by`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'dxd', 1, 1, 1, NULL, '2022-09-20 00:20:34', '2022-09-20 00:20:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document_types`
--

CREATE TABLE `document_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `document_types`
--

INSERT INTO `document_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'PDF', '2022-09-20 00:19:47', '2022-09-20 00:19:47'),
(2, 'Word', '2022-09-20 00:20:01', '2022-09-20 00:20:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee_payrolls`
--

CREATE TABLE `employee_payrolls` (
  `id` int(10) UNSIGNED NOT NULL,
  `sr_no` bigint(20) NOT NULL,
  `payroll_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `owner_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `net_salary` double NOT NULL,
  `status` int(11) NOT NULL,
  `basic_salary` double NOT NULL,
  `allowance` double NOT NULL,
  `deductions` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `employee_payrolls`
--

INSERT INTO `employee_payrolls` (`id`, `sr_no`, `payroll_id`, `type`, `owner_id`, `owner_type`, `month`, `year`, `net_salary`, `status`, `basic_salary`, `allowance`, `deductions`, `created_at`, `updated_at`) VALUES
(1, 1, 'CUMTIMTJ', 2, 1, 'App\\Models\\Doctor', 'January', 2022, 40000, 1, 400, 0, 0, '2022-10-04 13:40:09', '2022-10-04 13:40:09'),
(5, 3, 'CYG2UMQO', 1, 1, 'App\\Models\\Enfermera', 'April', 2022, 150000, 1, 2000, 500, 1000, '2022-10-05 20:40:17', '2022-10-05 20:40:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enquiries`
--

CREATE TABLE `enquiries` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_head` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `amount` double NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `front_services`
--

CREATE TABLE `front_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `front_services`
--

INSERT INTO `front_services` (`id`, `name`, `short_description`, `created_at`, `updated_at`) VALUES
(1, 'Medicina General', 'Prevención, detección, tratamiento y seguimiento de las enfermedades crónicas estabilizadas.', '2021-11-17 07:01:23', '2022-09-13 21:23:22'),
(2, 'Traumatología', 'Análisis, diagnóstico, tratamiento y seguimiento de dolencias adquiridas por el sistema músculo-esquelético.', '2021-11-17 07:01:23', '2022-09-21 22:43:01'),
(3, 'Neurología', 'Estudio del sistema nervioso, y de las enfermedades del cerebro, la médula, los nervios periféricos y los músculos.', '2021-11-17 07:01:23', '2022-09-21 22:43:42'),
(4, 'Reumatología', 'Prevenir, diagnosticar y tratar las enfermedades musculoesqueléticas y autoinmunes sistémicas.', '2021-11-17 07:01:23', '2022-09-21 22:44:24'),
(5, 'Endocrinología', 'Estudio de la síntesis, secreción, función hormonal, y de los mecanismos de regulación de la secreción hormonal.', '2021-11-17 07:01:23', '2022-09-21 22:45:19'),
(6, 'Ginecología', 'Patologías relacionadas con los órganos femeninos como el útero, la vagina y los ovarios.', '2021-11-17 07:01:23', '2022-09-21 22:45:56'),
(7, 'Neumología', 'Estudio de la fisiología y la patología del aparato respiratorio, así como de las técnicas diagnósticas, terapéuticas y preventivas necesarias.', '2021-11-17 07:01:23', '2022-09-21 22:46:52'),
(8, 'Pediatría', 'Rama de la medicina que involucra la atención médica de bebes, niños y adolescentes.', '2021-11-17 07:01:23', '2022-09-21 22:48:16'),
(9, 'Medicina Interna', 'Atención global al enfermo, asumiendo la completa responsabilidad de la misma, de una forma continua desde la consulta externa a las unidades de internación.', '2022-09-21 22:48:57', '2022-09-21 22:48:57'),
(10, 'Cirugía General', 'Procedimientos quirúrgicos tanto electivos como de urgencia, en los siguientes aparatos: digestivo, endocrino, mama, piel y partes blandas, pared abdominal y retroperitoneo.', '2022-09-21 22:49:36', '2022-09-21 22:49:36'),
(11, 'Dermatología', 'Estudio, conocimiento, diagnóstico y tratamiento de todas aquellas patologías o afecciones de la piel.', '2022-09-21 22:50:16', '2022-09-21 22:50:16'),
(12, 'Odontología', 'Ciencia de la salud que se centra en el diagnóstico, tratamiento y prevención de las enfermedades de la cavidad bucal.', '2022-09-21 22:50:45', '2022-09-21 22:50:45'),
(13, 'Salud Integral', 'Equilibrio entre los factores físicos, biológicos, emocionales, mentales, espirituales y sociales, que permiten un adecuado crecimiento y desarrollo en todos los ámbitos de la vida.', '2022-09-21 22:51:14', '2022-09-21 22:51:14'),
(14, 'Salud Sexual y Reproductiva', 'Estado de completo bienestar físico, mental y social que debe prevalecer durante las etapas preconcepcional, prenatal, parto y puerperio.', '2022-09-21 22:51:51', '2022-09-21 22:51:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `front_settings`
--

CREATE TABLE `front_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `front_settings`
--

INSERT INTO `front_settings` (`id`, `key`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'about_us_title', 'Centro Médico Vital', '1', '2021-11-17 07:01:23', '2022-09-13 20:19:43'),
(2, 'about_us_description', 'El “Centro Médico Vital” dirigido por el Doctor Adalid R. Llanos Martínez, ubicado en la Ciudad de Potosí Av. H. Players Nro. 421 “A”, realiza sus funciones desde el 2017 hasta la fecha como Médico Cirujano. Tiene como misión el garantizar una labor social a los pacientes, brindándoles asistencia médica integral, mediante un excelente servicio y una atención personalizada, brindando un servicio de emergencia las 24 horas, realizan campañas de información y prevención en las diferentes especialidades sobre las enfermedades que aquejan a la población a un costo accesible, con el fin de ayudar a la comunidad.', '1', '2021-11-17 07:01:23', '2022-09-13 20:19:43'),
(3, 'about_us_mission', 'Satisfacer las necesidades médico asistenciales en el cuidado de las personas, con una atención humanizada e integral en beneficio de la comunidad.', '1', '2021-11-17 07:01:23', '2022-09-29 18:22:03'),
(4, 'about_us_image', 'http://hms.test/assets/img/default_image.jpg', '1', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(5, 'home_page_experience', '6', '2', '2021-11-17 07:01:23', '2022-09-13 20:04:57'),
(6, 'home_page_title', 'CENTRO DE ESPECIALIDADES MÉDICO \"VITAL\"', '2', '2021-11-17 07:01:23', '2022-09-13 20:07:30'),
(7, 'home_page_description', 'Nuestro centro médico brinda atención de calidad para toda la familia mientras mantiene un ambiente agradable con los mejores servicios.', '2', '2021-11-17 07:01:23', '2022-09-13 20:09:24'),
(8, 'home_page_image', 'http://hms.test/web_front/images/main-banner/banner-one/woman-doctor.png', '2', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(9, 'terms_conditions', '\"<p>\\\"</p><p>terms_conditions</p><p>\\\"</p>\"', '2', '2021-11-17 07:01:23', '2022-09-29 18:22:58'),
(10, 'privacy_policy', '\"<p>\\\"</p><p>privacy_policy</p><p>\\\"</p>\"', '2', '2021-11-17 07:01:23', '2022-09-29 18:22:58'),
(11, 'home_page_certified_doctor_image', 'http://hms.test/web_front/images/healthcare-doctor/doctor-1.png', '2', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(12, 'home_page_certified_doctor_text', 'Atención médica de calidad', '2', '2021-11-17 07:01:23', '2022-09-21 22:39:14'),
(13, 'home_page_certified_doctor_title', 'Contar con médicos certificados y de alta calidad para usted', '2', '2021-11-17 07:01:23', '2022-09-21 22:39:14'),
(14, 'home_page_certified_doctor_description', 'Ser líderes regionales en servicios médico asistenciales contando con los mejores profesionales y tecnología de última generación, fortaleciendo el reconocimiento y confianza de la sociedad.', '2', '2021-11-17 07:01:23', '2022-09-13 20:42:33'),
(15, 'home_page_box_title', 'Free Consulting', '2', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(16, 'home_page_box_description', 'Proin gravida nibh vel velit auctor aliquet.', '2', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(17, 'home_page_step_1_title', 'Consultar Médico', '2', '2021-11-17 07:01:23', '2022-09-21 22:31:14'),
(18, 'home_page_step_1_description', 'Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin lorem quis bibendum auctor nisi elit.', '2', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(19, 'home_page_step_2_title', 'Solicitar Consulta', '2', '2021-11-17 07:01:23', '2022-09-21 22:23:39'),
(20, 'home_page_step_2_description', 'Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin lorem quis bibendum auctor nisi elit.', '2', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(21, 'home_page_step_3_title', 'Recibir Consulta', '2', '2021-11-17 07:01:23', '2022-09-21 22:23:39'),
(22, 'home_page_step_3_description', 'Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin lorem quis bibendum auctor nisi elit.', '2', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(23, 'home_page_step_4_title', 'Obtenga su solución', '2', '2021-11-17 07:01:23', '2022-09-21 22:23:39'),
(24, 'home_page_step_4_description', 'Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin lorem quis bibendum auctor nisi elit.', '2', '2021-11-17 07:01:23', '2022-09-29 18:21:23'),
(25, 'home_page_certified_box_title', 'Certificado Médico', '2', '2021-11-17 07:01:23', '2022-09-21 22:21:53'),
(26, 'home_page_certified_box_description', 'Profesionales con altos estudios especializados.', '2', '2021-11-17 07:01:23', '2022-09-21 22:21:53'),
(27, 'appointment_title', 'Póngase en contacto ahora y obtenga el mejor servicio médico hoy', '3', '2021-11-17 07:01:23', '2022-09-21 21:25:00'),
(28, 'appointment_description', 'Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin lorem quis bibendum auctor nisi elit consequat ipsum nec sagittis.', '3', '2021-11-17 07:01:23', '2022-09-29 18:22:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hospital_schedules`
--

CREATE TABLE `hospital_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `day_of_week` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `hospital_schedules`
--

INSERT INTO `hospital_schedules` (`id`, `day_of_week`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, '1', '09:00', '21:00', '2022-09-12 21:10:52', '2022-09-12 21:10:52'),
(2, '2', '09:00', '21:00', '2022-09-12 21:10:52', '2022-09-12 21:10:52'),
(3, '3', '09:00', '21:00', '2022-09-12 21:10:52', '2022-09-12 21:10:52'),
(4, '4', '09:00', '21:00', '2022-09-12 21:10:52', '2022-09-12 21:10:52'),
(5, '5', '09:00', '21:00', '2022-09-12 21:10:52', '2022-09-12 21:10:52'),
(6, '6', '09:00', '21:00', '2022-09-12 21:10:52', '2022-09-12 21:10:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incomes`
--

CREATE TABLE `incomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `income_head` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime NOT NULL,
  `amount` double NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insurances`
--

CREATE TABLE `insurances` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_tax` double NOT NULL,
  `discount` double DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insurance_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `insurance_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hospital_rate` double NOT NULL,
  `total` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `insurances`
--

INSERT INTO `insurances` (`id`, `name`, `service_tax`, `discount`, `remark`, `insurance_no`, `insurance_code`, `hospital_rate`, `total`, `status`, `created_at`, `updated_at`) VALUES
(1, 'seguro de vida contra accidentes', 1000, 0, NULL, '1', 'dscd', 50, 2050, 1, '2022-09-19 21:45:22', '2022-09-19 21:45:22'),
(2, 'seguro de vida contra accidentes de', 455, 0, NULL, '1', '', 100, 987, 1, '2022-09-19 21:51:54', '2022-09-19 21:51:54'),
(3, 'xasx', 324, 0, NULL, '2', '', 50, 818, 1, '2022-09-19 21:53:21', '2022-09-19 21:53:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insurance_diseases`
--

CREATE TABLE `insurance_diseases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `insurance_id` int(10) UNSIGNED NOT NULL,
  `disease_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disease_charge` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `insurance_diseases`
--

INSERT INTO `insurance_diseases` (`id`, `insurance_id`, `disease_name`, `disease_charge`, `created_at`, `updated_at`) VALUES
(1, 1, 'covid', 1000, '2022-09-19 21:45:22', '2022-09-19 21:45:22'),
(2, 2, 'ewrew', 432, '2022-09-19 21:51:54', '2022-09-19 21:51:54'),
(3, 3, 'ewrew', 444, '2022-09-19 21:53:21', '2022-09-19 21:53:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `investigation_reports`
--

CREATE TABLE `investigation_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `invoice_date` date NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_id`, `patient_id`, `invoice_date`, `amount`, `discount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Z7VO0F', 1, '2022-09-22', 50.00, 0.00, 1, '2022-09-22 23:30:32', '2022-09-22 23:30:32'),
(2, 'NMV5HX', 1, '2022-09-29', 50.00, 0.00, 1, '2022-09-29 17:41:02', '2022-09-29 17:41:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `account_id`, `invoice_id`, `description`, `quantity`, `price`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 1, 50.00, 50.00, '2022-09-22 23:30:32', '2022-09-22 23:30:32'),
(2, 1, 2, NULL, 1, 50.00, 50.00, '2022-09-29 17:41:02', '2022-09-29 17:41:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ipd_bills`
--

CREATE TABLE `ipd_bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `total_charges` int(11) NOT NULL,
  `total_payments` int(11) NOT NULL,
  `gross_total` int(11) NOT NULL,
  `discount_in_percentage` int(11) NOT NULL,
  `tax_in_percentage` int(11) NOT NULL,
  `other_charges` int(11) NOT NULL,
  `net_payable_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ipd_charges`
--

CREATE TABLE `ipd_charges` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `charge_type_id` int(11) NOT NULL,
  `charge_category_id` int(10) UNSIGNED NOT NULL,
  `charge_id` int(10) UNSIGNED NOT NULL,
  `standard_charge` int(11) DEFAULT NULL,
  `applied_charge` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ipd_consultant_registers`
--

CREATE TABLE `ipd_consultant_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `applied_date` datetime NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `instruction` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `instruction_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ipd_diagnoses`
--

CREATE TABLE `ipd_diagnoses` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `report_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_date` datetime NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ipd_diagnoses`
--

INSERT INTO `ipd_diagnoses` (`id`, `ipd_patient_department_id`, `report_type`, `report_date`, `description`, `created_at`, `updated_at`) VALUES
(2, 8, 'xxd', '2022-09-30 19:04:00', 'xdcd', '2022-09-30 23:04:17', '2022-09-30 23:04:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ipd_patient_departments`
--

CREATE TABLE `ipd_patient_departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `ipd_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symptoms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admission_date` datetime NOT NULL,
  `case_id` int(10) UNSIGNED NOT NULL,
  `is_old_patient` tinyint(1) DEFAULT 0,
  `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bed_type_id` int(10) UNSIGNED DEFAULT NULL,
  `bed_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bill_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ipd_patient_departments`
--

INSERT INTO `ipd_patient_departments` (`id`, `patient_id`, `ipd_number`, `height`, `weight`, `bp`, `symptoms`, `notes`, `admission_date`, `case_id`, `is_old_patient`, `doctor_id`, `bed_type_id`, `bed_id`, `created_at`, `updated_at`, `bill_status`) VALUES
(7, 1, '2FVNILR9', '0', '0', NULL, NULL, NULL, '2022-09-29 20:12:00', 1, 0, 1, NULL, NULL, '2022-09-30 00:12:56', '2022-09-30 00:12:56', 0),
(8, 1, 'QIMZIJNK', '0', '0', NULL, NULL, NULL, '2022-09-29 20:13:00', 1, 0, 1, NULL, NULL, '2022-09-30 00:13:34', '2022-09-30 00:13:34', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ipd_payments`
--

CREATE TABLE `ipd_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `payment_mode` tinyint(4) NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ipd_prescriptions`
--

CREATE TABLE `ipd_prescriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `header_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ipd_prescription_items`
--

CREATE TABLE `ipd_prescription_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipd_prescription_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `medicine_id` int(10) UNSIGNED NOT NULL,
  `dosage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instruction` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ipd_timelines`
--

CREATE TABLE `ipd_timelines` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible_to_person` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `issued_items`
--

CREATE TABLE `issued_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `issued_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issued_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `item_category_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items`
--

CREATE TABLE `items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_category_id` int(10) UNSIGNED NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `available_quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_categories`
--

CREATE TABLE `item_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_stocks`
--

CREATE TABLE `item_stocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_category_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `supplier_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `purchase_price` double NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lab_technicians`
--

CREATE TABLE `lab_technicians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `live_consultations`
--

CREATE TABLE `live_consultations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `consultation_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consultation_date` datetime NOT NULL,
  `host_video` tinyint(1) NOT NULL,
  `participant_video` tinyint(1) NOT NULL,
  `consultation_duration_minutes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meeting_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `live_meetings`
--

CREATE TABLE `live_meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consultation_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consultation_date` datetime NOT NULL,
  `consultation_duration_minutes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host_video` tinyint(1) NOT NULL,
  `participant_video` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meeting_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `live_meetings_candidates`
--

CREATE TABLE `live_meetings_candidates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `live_meeting_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mails`
--

CREATE TABLE `mails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `conversions_disk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generated_conversions` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`, `conversions_disk`, `uuid`, `generated_conversions`) VALUES
(2, 'App\\Models\\FrontService', 2, 'front-services', 'orthopedics', 'orthopedics.png', 'image/png', 'public', 11259, '[]', '[]', '[]', 2, '2021-11-17 07:01:23', '2021-11-17 07:01:23', 'public', 'f5257889-ab4d-49e6-93be-6c9471b9fbfa', '[]'),
(3, 'App\\Models\\FrontService', 3, 'front-services', 'pulmonology', 'pulmonology.png', 'image/png', 'public', 14513, '[]', '[]', '[]', 3, '2021-11-17 07:01:23', '2021-11-17 07:01:23', 'public', 'b8c2e500-a191-4b1d-8867-cbcc004a4bf1', '[]'),
(4, 'App\\Models\\FrontService', 4, 'front-services', 'dental-care', 'dental-care.png', 'image/png', 'public', 11787, '[]', '[]', '[]', 4, '2021-11-17 07:01:23', '2021-11-17 07:01:23', 'public', 'e286ca50-3530-4681-a931-9267033e5f31', '[]'),
(5, 'App\\Models\\FrontService', 5, 'front-services', 'medicine', 'medicine.png', 'image/png', 'public', 12927, '[]', '[]', '[]', 5, '2021-11-17 07:01:23', '2021-11-17 07:01:23', 'public', '27922316-504b-4529-a5eb-4ecb779ce87c', '[]'),
(6, 'App\\Models\\FrontService', 6, 'front-services', 'ambulance', 'ambulance.png', 'image/png', 'public', 10350, '[]', '[]', '[]', 6, '2021-11-17 07:01:23', '2021-11-17 07:01:23', 'public', '7612cdec-7e91-422a-9257-835db4ecf560', '[]'),
(7, 'App\\Models\\FrontService', 7, 'front-services', 'ophthalmology', 'ophthalmology.png', 'image/png', 'public', 19751, '[]', '[]', '[]', 7, '2021-11-17 07:01:23', '2021-11-17 07:01:23', 'public', 'a5f1c786-e97d-43bd-9f17-08ef73bf7ad2', '[]'),
(8, 'App\\Models\\FrontService', 8, 'front-services', 'neurology', 'neurology.png', 'image/png', 'public', 13907, '[]', '[]', '[]', 8, '2021-11-17 07:01:23', '2021-11-17 07:01:23', 'public', '4df59fa9-76f3-4de6-83ad-4fe6bd1d9268', '[]'),
(11, 'App\\Models\\FrontService', 1, 'front-services', 'medicine', 'medicine.png', 'image/png', 'public', 12927, '[]', '[]', '[]', 10, '2022-09-13 21:25:09', '2022-09-13 21:25:09', 'public', '6f794efe-4c2b-4249-bea5-2f702f47fe0e', '[]'),
(13, 'App\\Models\\Setting', 2, 'settings', 'logoo', 'logoo.png', 'image/png', 'public', 8944, '[]', '[]', '[]', 11, '2022-09-14 18:44:05', '2022-09-14 18:44:05', 'public', '193568ee-3b50-4c5e-9d22-a43a9ff73f58', '[]'),
(14, 'App\\Models\\Document', 1, 'documents', 'Informe LAB', 'Informe-LAB.pdf', 'application/pdf', 'public', 6901, '[]', '[]', '[]', 12, '2022-09-20 00:20:34', '2022-09-20 00:20:34', 'public', '50245177-4cb3-48a7-8a2d-2b60d5db6bfd', '[]'),
(15, 'App\\Models\\Testimonial', 2, 'testimonials', 'centro', 'Testimonial-1664476030.jpg', 'image/jpeg', 'public', 60909, '[]', '[]', '[]', 13, '2022-09-29 18:27:10', '2022-09-29 18:27:10', 'public', '0bedd63b-ea65-4eaa-8a17-1be7bf46fd37', '[]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicines`
--

CREATE TABLE `medicines` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selling_price` double DEFAULT NULL,
  `buying_price` double DEFAULT NULL,
  `salt_composition` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `side_effects` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medicines`
--

INSERT INTO `medicines` (`id`, `category_id`, `brand_id`, `name`, `selling_price`, `buying_price`, `salt_composition`, `description`, `side_effects`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'dcd', NULL, NULL, '', NULL, NULL, '2022-09-26 23:02:11', '2022-09-26 23:02:11'),
(2, 2, 1, 'Ibuprofeno', NULL, NULL, '', NULL, NULL, '2022-09-30 23:15:42', '2022-09-30 23:15:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_05_03_000001_create_customer_columns', 1),
(4, '2019_05_03_000002_create_subscriptions_table', 1),
(5, '2019_05_03_000003_create_subscription_items_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2020_02_06_031618_create_categories_table', 1),
(8, '2020_02_12_053840_create_doctor_departments_table', 1),
(9, '2020_02_12_053932_create_departments_table', 1),
(10, '2020_02_13_042835_create_brands_table', 1),
(11, '2020_02_13_053840_create_doctors_table', 1),
(12, '2020_02_13_054103_create_patients_table', 1),
(13, '2020_02_13_094724_create_bills_table', 1),
(14, '2020_02_13_095024_create_medicines_table', 1),
(15, '2020_02_13_095125_create_bill_items_table', 1),
(16, '2020_02_13_111857_create_nurses_table', 1),
(17, '2020_02_13_125601_create_addresses_table', 1),
(18, '2020_02_13_141104_create_media_table', 1),
(19, '2020_02_14_051650_create_lab_technicians_table', 1),
(20, '2020_02_14_055353_create_appointments_table', 1),
(21, '2020_02_14_091441_create_receptionists_table', 1),
(22, '2020_02_14_093246_create_pharmacists_table', 1),
(23, '2020_02_17_053450_create_accountants_table', 1),
(24, '2020_02_17_080856_create_bed_types_table', 1),
(25, '2020_02_17_092326_create_blood_banks_table', 1),
(26, '2020_02_17_105627_create_beds_table', 1),
(27, '2020_02_17_110620_create_blood_donors_table', 1),
(28, '2020_02_17_135716_create_permission_tables', 1),
(29, '2020_02_18_042327_create_notice_boards_table', 1),
(30, '2020_02_18_042442_create_document_types_table', 1),
(31, '2020_02_18_060222_create_patient_cases_table', 1),
(32, '2020_02_18_060223_create_operation_reports_table', 1),
(33, '2020_02_18_064953_create_bed_assigns_table', 1),
(34, '2020_02_18_092202_create_documents_table', 1),
(35, '2020_02_18_094758_create_birth_reports_table', 1),
(36, '2020_02_18_111020_create_death_reports_table', 1),
(37, '2020_02_19_080336_create_employee_payrolls_table', 1),
(38, '2020_02_19_134502_create_settings_table', 1),
(39, '2020_02_21_090236_create_investigation_reports_table', 1),
(40, '2020_02_21_095439_create_accounts_table', 1),
(41, '2020_02_22_070658_create_payments_table', 1),
(42, '2020_02_22_090112_create_insurances_table', 1),
(43, '2020_02_22_091537_create_insurance_disease_table', 1),
(44, '2020_02_24_055136_create_invoices_table', 1),
(45, '2020_02_24_055518_create_schedules_table', 1),
(46, '2020_02_24_055702_create_invoice_items_table', 1),
(47, '2020_02_25_105042_create_services_table', 1),
(48, '2020_02_25_131030_create_packages_table', 1),
(49, '2020_02_25_131108_create_package_services_table', 1),
(50, '2020_02_27_120948_create_patient_admissions_table', 1),
(51, '2020_02_28_031410_create_case_handlers_table', 1),
(52, '2020_03_02_043813_create_advanced_payments_table', 1),
(53, '2020_03_02_065845_add_patient_admission_id_to_bills', 1),
(54, '2020_03_03_062243_add_patient_id_to_bills', 1),
(55, '2020_03_03_113334_create_schedule_day_table', 1),
(56, '2020_03_26_052336_create_ambulances_table', 1),
(57, '2020_03_26_081157_create_mails_table', 1),
(58, '2020_03_27_061641_create_enquiries_table', 1),
(59, '2020_03_27_063148_create_ambulance_calls_table', 1),
(60, '2020_03_31_122219_create_prescriptions_table', 1),
(61, '2020_04_11_052629_create_charge_categories_table', 1),
(62, '2020_04_11_053929_create_pathology_categories_table', 1),
(63, '2020_04_11_070859_create_radiology_categories_table', 1),
(64, '2020_04_11_090903_create_charges_table', 1),
(65, '2020_04_13_050643_create_radiology_tests_table', 1),
(66, '2020_04_14_093339_create_pathology_tests_table', 1),
(67, '2020_04_24_111205_create_doctor_opd_charge_table', 1),
(68, '2020_04_28_094118_create_expenses_table', 1),
(69, '2020_05_01_055137_create_incomes_table', 1),
(70, '2020_05_11_083050_add_notes_documents_table', 1),
(71, '2020_05_12_075825_create_sms_table', 1),
(72, '2020_06_22_071531_add_index_to_accounts_table', 1),
(73, '2020_06_22_071943_add_index_to_doctor_opd_charges_table', 1),
(74, '2020_06_22_072921_add_index_to_bed_assigns_table', 1),
(75, '2020_06_22_073042_add_index_to_medicines_table', 1),
(76, '2020_06_22_073457_add_index_to_employee_payrolls_table', 1),
(77, '2020_06_22_074937_add_index_to_notice_boards_table', 1),
(78, '2020_06_22_075222_add_index_to_blood_donors_table', 1),
(79, '2020_06_22_075359_add_index_to_packages_table', 1),
(80, '2020_06_22_075506_add_index_to_bed_types_table', 1),
(81, '2020_06_22_075725_add_index_to_services_table', 1),
(82, '2020_06_22_080944_add_index_to_invoices_table', 1),
(83, '2020_06_22_081601_add_index_to_payments_table', 1),
(84, '2020_06_22_081802_add_index_to_advanced_payments_table', 1),
(85, '2020_06_22_081909_add_index_to_bills_table', 1),
(86, '2020_06_22_082548_add_index_to_beds_table', 1),
(87, '2020_06_22_082942_add_index_to_blood_banks_table', 1),
(88, '2020_06_22_083511_add_index_to_users_table', 1),
(89, '2020_06_22_084750_add_index_to_patient_cases_table', 1),
(90, '2020_06_22_084912_add_index_to_patient_admissions_table', 1),
(91, '2020_06_22_085036_add_index_to_document_types_table', 1),
(92, '2020_06_22_085128_add_index_to_insurances_table', 1),
(93, '2020_06_22_085317_add_index_to_ambulances_table', 1),
(94, '2020_06_22_090509_add_index_to_ambulance_calls_table', 1),
(95, '2020_06_22_091253_add_index_to_doctor_departments_table', 1),
(96, '2020_06_22_091455_add_index_to_appointments_table', 1),
(97, '2020_06_22_091617_add_index_to_birth_reports_table', 1),
(98, '2020_06_22_091632_add_index_to_death_reports_table', 1),
(99, '2020_06_22_091651_add_index_to_investigation_reports_table', 1),
(100, '2020_06_22_091828_add_index_to_operation_reports_table', 1),
(101, '2020_06_22_092018_add_index_to_categories_table', 1),
(102, '2020_06_22_092149_add_index_to_brands_table', 1),
(103, '2020_06_22_092324_add_index_to_pathology_tests_table', 1),
(104, '2020_06_22_092338_add_index_to_pathology_categories_table', 1),
(105, '2020_06_22_092347_add_index_to_radiology_tests_table', 1),
(106, '2020_06_22_092357_add_index_to_radiology_categories_table', 1),
(107, '2020_06_22_092651_add_index_to_expenses_table', 1),
(108, '2020_06_22_092702_add_index_to_incomes_table', 1),
(109, '2020_06_22_092855_add_index_to_charges_table', 1),
(110, '2020_06_22_092905_add_index_to_charge_categories_table', 1),
(111, '2020_06_22_093234_add_index_to_enquiries_table', 1),
(112, '2020_06_24_044648_create_diagnosis_categories_table', 1),
(113, '2020_06_25_080242_create_patient_diagnosis_tests_table', 1),
(114, '2020_06_26_054352_create_patient_diagnosis_properties_table', 1),
(115, '2020_07_15_044653_remove_serial_visibility_from_schedules_table', 1),
(116, '2020_07_15_121336_change_ambulances_table_column', 1),
(117, '2020_07_22_052934_change_bed_assigns_table_column', 1),
(118, '2020_07_29_095430_change_invoice_items_table_column', 1),
(119, '2020_08_26_081235_create_item_categories_table', 1),
(120, '2020_08_26_101134_create_items_table', 1),
(121, '2020_08_26_125032_create_item_stocks_table', 1),
(122, '2020_08_27_141547_create_issued_items_table', 1),
(123, '2020_09_08_064222_create_ipd_patient_departments_table', 1),
(124, '2020_09_08_114627_create_ipd_diagnoses_table', 1),
(125, '2020_09_09_065624_create_ipd_consultant_registers_table', 1),
(126, '2020_09_09_135505_create_ipd_charges_table', 1),
(127, '2020_09_10_112306_create_ipd_prescriptions_table', 1),
(128, '2020_09_10_114203_create_ipd_prescription_items_table', 1),
(129, '2020_09_11_045308_create_modules_table', 1),
(130, '2020_09_12_050715_create_ipd_payments_table', 1),
(131, '2020_09_12_071821_create_ipd_timelines_table', 1),
(132, '2020_09_12_103003_create_ipd_bills_table', 1),
(133, '2020_09_14_083759_create_opd_patient_departments_table', 1),
(134, '2020_09_14_144731_add_ipd_patient_department_id_to_bed_assigns_table', 1),
(135, '2020_09_15_064044_create_transactions_table', 1),
(136, '2020_09_16_103204_create_opd_diagnoses_table', 1),
(137, '2020_09_16_114031_create_opd_timelines_table', 1),
(138, '2020_09_23_045100_change_patient_diagnosis_properties_table', 1),
(139, '2020_09_24_053229_add_ipd_bill_column_in_ipd_patient_departments_table', 1),
(140, '2020_10_09_085838_create_call_logs_table', 1),
(141, '2020_10_12_125133_create_visitors_table', 1),
(142, '2020_10_14_044134_create_postals_table', 1),
(143, '2020_10_30_043500_add_route_in_modules_table', 1),
(144, '2020_10_31_062448_add_complete_in_appointments_table', 1),
(145, '2020_11_02_050736_create_testimonials_table', 1),
(146, '2020_11_07_121633_add_region_code_in_sms_table', 1),
(147, '2020_11_19_093810_create_blood_donations_table', 1),
(148, '2020_11_20_113830_create_blood_issues_table', 1),
(149, '2020_11_24_131253_create_notifications_table', 1),
(150, '2020_12_28_131351_create_live_consultations_table', 1),
(151, '2020_12_31_062506_create_live_meetings_table', 1),
(152, '2020_12_31_091242_create_live_meetings_candidates_table', 1),
(153, '2021_01_05_100425_create_user_zoom_credential_table', 1),
(154, '2021_01_06_105407_add_metting_id_to_live_meetings_table', 1),
(155, '2021_02_23_065200_create_vaccinations_table', 1),
(156, '2021_02_23_065252_create_vaccinated_patients_table', 1),
(157, '2021_04_05_085646_create_front_settings_table', 1),
(158, '2021_05_10_000000_add_uuid_to_failed_jobs_table', 1),
(159, '2021_05_29_103036_add_conversions_disk_column_in_media_table', 1),
(160, '2021_06_07_104022_change_patient_foreign_key_type_in_appointments_table', 1),
(161, '2021_06_08_073918_change_department_foreign_key_in_appointments_table', 1),
(162, '2021_06_21_082754_update_amount_datatype_in_bills_table', 1),
(163, '2021_06_21_082845_update_amount_datatype_in_bill_items_table', 1),
(164, '2021_11_11_061443_create_front_services_table', 1),
(165, '2021_11_12_100750_create_hospital_schedules_table', 1),
(166, '2021_11_12_105805_add_social_details_in_users_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(3, 'App\\Models\\User', 12),
(4, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `modules`
--

INSERT INTO `modules` (`id`, `name`, `is_active`, `route`, `created_at`, `updated_at`) VALUES
(1, 'Patients', 1, 'patients.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(2, 'Doctors', 1, 'doctors.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(3, 'Accountants', 1, 'accountants.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(4, 'Medicines', 1, 'medicines.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(5, 'Nurses', 1, 'nurses.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(6, 'Receptionists', 1, 'receptionists.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(7, 'Lab Technicians', 1, 'lab-technicians.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(8, 'Pharmacists', 1, 'pharmacists.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(9, 'Birth Reports', 1, 'birth-reports.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(10, 'Death Reports', 1, 'death-reports.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(11, 'Investigation Reports', 1, 'investigation-reports.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(12, 'Operation Reports', 1, 'operation-reports.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(13, 'Income', 1, 'incomes.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(14, 'Expense', 1, 'expenses.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(15, 'SMS', 1, 'sms.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(16, 'IPD Patients', 1, 'ipd.patient.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(17, 'OPD Patients', 1, 'opd.patient.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(18, 'Accounts', 1, 'accounts.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(19, 'Employee Payrolls', 1, 'employee-payrolls.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(20, 'Invoices', 1, 'invoices.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(21, 'Payments', 1, 'payments.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(22, 'Payment Reports', 1, 'payment.reports', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(23, 'Advance Payments', 1, 'advanced-payments.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(24, 'Bills', 1, 'bills.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(25, 'Bed Types', 1, 'bed-types.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(26, 'Beds', 1, 'beds.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(27, 'Bed Assigns', 1, 'bed-assigns.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(28, 'Blood Banks', 1, 'blood-banks.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(29, 'Blood Donors', 1, 'blood-donors.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(30, 'Documents', 1, 'documents.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(31, 'Document Types', 1, 'document-types.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(32, 'Services', 1, 'services.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(33, 'Insurances', 1, 'insurances.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(34, 'Packages', 1, 'packages.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(35, 'Ambulances', 1, 'ambulances.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(36, 'Ambulances Calls', 1, 'ambulance-calls.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(37, 'Appointments', 1, 'appointments.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(38, 'Call Logs', 1, 'call_logs.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(39, 'Visitors', 1, 'visitors.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(40, 'Postal Receive', 1, 'receives.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(41, 'Postal Dispatch', 1, 'dispatches.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(42, 'Notice Boards', 1, 'noticeboard', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(43, 'Mail', 1, 'mail', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(44, 'Enquires', 1, 'enquiries', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(45, 'Charge Categories', 1, 'charge-categories.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(46, 'Charges', 1, 'charges.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(47, 'Doctor OPD Charges', 1, 'doctor-opd-charges.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(48, 'Items Categories', 1, 'item-categories.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(49, 'Items', 1, 'items.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(50, 'Item Stocks', 1, 'item.stock.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(51, 'Issued Items', 1, 'issued.item.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(52, 'Diagnosis Categories', 1, 'diagnosis.category.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(53, 'Diagnosis Tests', 1, 'patient.diagnosis.test.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(54, 'Pathology Categories', 1, 'pathology.category.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(55, 'Pathology Tests', 1, 'pathology.test.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(56, 'Radiology Categories', 1, 'radiology.category.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(57, 'Radiology Tests', 1, 'radiology.test.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(58, 'Medicine Categories', 1, 'categories.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(59, 'Medicine Brands', 1, 'brands.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(60, 'Doctor Departments', 1, 'doctor-departments.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(61, 'Schedules', 1, 'schedules.index', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(62, 'Prescriptions', 1, 'prescriptions.index', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(63, 'Cases', 1, 'patient-cases.index', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(64, 'Case Handlers', 1, 'case-handlers.index', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(65, 'Patient Admissions', 1, 'patient-admissions.index', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(66, 'My Payrolls', 1, 'payroll', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(67, 'Patient Cases', 1, 'patients.cases', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(68, 'Testimonial', 1, 'testimonials.index', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(69, 'Blood Donations', 1, 'blood-donations.index', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(70, 'Blood Issues', 1, 'blood-issues.index', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(71, 'Live Consultations', 1, 'live.consultation.index', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(72, 'Live Meetings', 1, 'live.meeting.index', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(73, 'Vaccinations', 1, 'vaccinations.index', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(74, 'Vaccinated Patients', 1, 'vaccinated-patients.index', '2021-11-17 07:01:23', '2021-11-17 07:01:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notice_boards`
--

CREATE TABLE `notice_boards` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notice_boards`
--

INSERT INTO `notice_boards` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'dcvdfv', 'dcdvdfcdcdscdscs', '2022-09-29 17:41:30', '2022-09-29 17:41:30'),
(2, 'cdfvfc', 'c gbhmkumn', '2022-09-29 17:44:56', '2022-09-29 17:44:56'),
(3, 'dc df', 'cdf', '2022-09-29 18:25:42', '2022-09-29 18:25:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL,
  `notification_for` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notification_for`, `user_id`, `title`, `text`, `meta`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 13, 2, 2, 'Israel Salguero case has been created.', NULL, NULL, '2022-09-29 17:38:34', '2022-09-12 19:07:00', '2022-09-29 17:38:34'),
(2, 13, 4, 3, 'Israel Salguero your case has been created.', NULL, NULL, NULL, '2022-09-12 19:07:00', '2022-09-12 19:07:00'),
(3, 1, 2, 2, 'Israel Salguero appointment has been booked.', NULL, NULL, '2022-09-29 17:38:32', '2022-09-12 21:19:11', '2022-09-29 17:38:32'),
(4, 1, 4, 3, 'Israel Salguero your appointment has been booked.', NULL, NULL, NULL, '2022-09-12 21:19:11', '2022-09-12 21:19:11'),
(5, 1, 3, 5, 'Israel Salguero appointment has been booked.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-12 21:19:11', '2022-09-29 23:43:24'),
(6, 1, 2, 2, 'Israel Salguero appointment has been booked.', NULL, NULL, '2022-09-29 17:38:31', '2022-09-12 21:39:32', '2022-09-29 17:38:31'),
(7, 1, 4, 3, 'Israel Salguero your appointment has been booked.', NULL, NULL, NULL, '2022-09-12 21:39:32', '2022-09-12 21:39:32'),
(8, 1, 3, 5, 'Israel Salguero appointment has been booked.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-12 21:39:32', '2022-09-29 23:43:24'),
(9, 1, 2, 2, 'Israel Salguero appointment has been booked.', NULL, NULL, '2022-09-29 17:38:30', '2022-09-12 21:45:21', '2022-09-29 17:38:30'),
(10, 1, 4, 3, 'Israel Salguero your appointment has been booked.', NULL, NULL, NULL, '2022-09-12 21:45:21', '2022-09-12 21:45:21'),
(11, 1, 3, 5, 'Israel Salguero appointment has been booked.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-12 21:45:21', '2022-09-29 23:43:24'),
(12, 1, 2, 2, 'Israel Salguero appointment has been booked.', NULL, NULL, '2022-09-29 17:38:27', '2022-09-12 21:55:27', '2022-09-29 17:38:27'),
(13, 1, 4, 3, 'Israel Salguero your appointment has been booked.', NULL, NULL, NULL, '2022-09-12 21:55:27', '2022-09-12 21:55:27'),
(14, 1, 3, 5, 'Israel Salguero appointment has been booked.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-12 21:55:27', '2022-09-29 23:43:24'),
(15, 15, 2, 2, 'New notice board added.', NULL, NULL, '2022-09-29 17:38:28', '2022-09-13 21:35:39', '2022-09-29 17:38:28'),
(16, 15, 4, 3, 'New notice board added.', NULL, NULL, NULL, '2022-09-13 21:35:40', '2022-09-13 21:35:40'),
(17, 15, 5, 4, 'New notice board added.', NULL, NULL, NULL, '2022-09-13 21:35:40', '2022-09-13 21:35:40'),
(18, 15, 3, 5, 'New notice board added.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-13 21:35:40', '2022-09-29 23:43:24'),
(19, 1, 2, 2, 'Juan Pinto appointment has been booked.', NULL, NULL, '2022-09-29 17:38:26', '2022-09-13 22:53:26', '2022-09-29 17:38:26'),
(20, 1, 4, 6, 'Juan Pinto your appointment has been booked.', NULL, NULL, NULL, '2022-09-13 22:53:26', '2022-09-13 22:53:26'),
(21, 1, 3, 5, 'Juan Pinto appointment has been booked.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-13 22:53:26', '2022-09-29 23:43:24'),
(22, 12, 3, 5, 'dffew fdfd added as a patient.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-19 15:32:08', '2022-09-29 23:43:24'),
(23, 13, 2, 7, 'Israel Salguero case has been created.', NULL, NULL, NULL, '2022-09-19 17:32:28', '2022-09-19 17:32:28'),
(24, 13, 4, 3, 'Israel Salguero your case has been created.', NULL, NULL, NULL, '2022-09-19 17:32:28', '2022-09-19 17:32:28'),
(25, 13, 3, 5, 'Israel Salguero case has been created.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-19 17:32:28', '2022-09-29 23:43:24'),
(26, 18, 3, 5, 'New service has been added.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-19 20:54:09', '2022-09-29 23:43:24'),
(27, 1, 2, 2, 'Israel Salguero appointment has been booked.', NULL, NULL, '2022-09-29 17:38:23', '2022-09-20 18:30:15', '2022-09-29 17:38:23'),
(28, 1, 4, 3, 'Israel Salguero your appointment has been booked.', NULL, NULL, NULL, '2022-09-20 18:30:15', '2022-09-20 18:30:15'),
(29, 1, 3, 5, 'Israel Salguero appointment has been booked.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-20 18:30:15', '2022-09-29 23:43:24'),
(30, 1, 2, 2, 'Dffew Fdfd appointment has been booked.', NULL, NULL, '2022-09-29 17:38:24', '2022-09-20 18:55:33', '2022-09-29 17:38:24'),
(31, 1, 4, 8, 'Dffew Fdfd your appointment has been booked.', NULL, NULL, NULL, '2022-09-20 18:55:33', '2022-09-20 18:55:33'),
(32, 1, 3, 5, 'Dffew Fdfd appointment has been booked.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-20 18:55:33', '2022-09-29 23:43:24'),
(33, 2, 4, 3, 'Israel Salguero your invoice has been Pagado', NULL, NULL, NULL, '2022-09-22 23:30:32', '2022-09-22 23:30:32'),
(34, 2, 3, 5, 'Israel Salguero invoice has been Pagado', NULL, NULL, '2022-09-29 23:43:24', '2022-09-22 23:30:32', '2022-09-29 23:43:24'),
(35, 3, 4, 3, 'Israel Salguero your bills has been created.', NULL, NULL, NULL, '2022-09-22 23:58:46', '2022-09-22 23:58:46'),
(36, 3, 2, 2, 'Israel Salguero bills has been created.', NULL, NULL, '2022-09-29 17:38:22', '2022-09-22 23:58:46', '2022-09-29 17:38:22'),
(37, 3, 3, 5, 'Israel Salguero bills has been created.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-22 23:58:46', '2022-09-29 23:43:24'),
(38, 18, 3, 5, 'New service has been added.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-23 18:57:54', '2022-09-29 23:43:24'),
(39, 18, 3, 5, 'New service has been added.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-23 18:59:02', '2022-09-29 23:43:24'),
(40, 18, 3, 5, 'New service has been added.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-23 19:00:09', '2022-09-29 23:43:24'),
(41, 18, 3, 5, 'New service has been added.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-23 19:00:47', '2022-09-29 23:43:24'),
(42, 18, 3, 5, 'New service has been added.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-23 19:01:14', '2022-09-29 23:43:24'),
(43, 18, 3, 5, 'New service has been added.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-23 19:01:39', '2022-09-29 23:43:24'),
(44, 18, 3, 5, 'New service has been added.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-23 19:02:38', '2022-09-29 23:43:24'),
(45, 18, 3, 5, 'New service has been added.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-23 19:03:08', '2022-09-29 23:43:24'),
(46, 18, 3, 5, 'New service has been added.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-23 19:03:32', '2022-09-29 23:43:24'),
(47, 18, 3, 5, 'New service has been added.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-23 19:04:07', '2022-09-29 23:43:24'),
(48, 13, 2, 7, 'Juan Pinto case has been created.', NULL, NULL, NULL, '2022-09-28 21:32:10', '2022-09-28 21:32:10'),
(49, 13, 4, 6, 'Juan Pinto your case has been created.', NULL, NULL, NULL, '2022-09-28 21:32:10', '2022-09-28 21:32:10'),
(50, 13, 3, 5, 'Juan Pinto case has been created.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-28 21:32:10', '2022-09-29 23:43:24'),
(51, 1, 2, 2, 'Juan Pinto appointment has been bookedE.', NULL, NULL, '2022-09-29 17:38:20', '2022-09-29 17:17:46', '2022-09-29 17:38:20'),
(52, 1, 4, 6, 'Juan Pinto your appointment has been booked.', NULL, NULL, NULL, '2022-09-29 17:17:46', '2022-09-29 17:17:46'),
(53, 1, 3, 5, 'Juan Pinto appointment has been bookedE.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-29 17:17:46', '2022-09-29 23:43:24'),
(54, 1, 2, 2, 'Israel Salguero, la cita ha sido reservada.', NULL, NULL, '2022-09-29 17:38:17', '2022-09-29 17:24:36', '2022-09-29 17:38:17'),
(55, 1, 4, 3, 'Israel Salguero your appointment has been booked.', NULL, NULL, NULL, '2022-09-29 17:24:36', '2022-09-29 17:24:36'),
(56, 1, 3, 5, 'Israel Salguero, la cita ha sido reservada.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-29 17:24:36', '2022-09-29 23:43:24'),
(57, 1, 2, 2, 'Israel Salguero, la cita ha sido reservada.', NULL, NULL, '2022-09-29 17:44:23', '2022-09-29 17:39:31', '2022-09-29 17:44:23'),
(58, 1, 4, 3, 'Israel Salguero your appointment has been booked.', NULL, NULL, NULL, '2022-09-29 17:39:31', '2022-09-29 17:39:31'),
(59, 1, 3, 5, 'Israel Salguero, la cita ha sido reservada.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-29 17:39:31', '2022-09-29 23:43:24'),
(60, 13, 2, 2, 'Israel Salguero, se ha creado el caso.', NULL, NULL, '2022-09-29 17:44:22', '2022-09-29 17:39:59', '2022-09-29 17:44:22'),
(61, 13, 4, 3, 'Israel Salguero your case has been created.', NULL, NULL, NULL, '2022-09-29 17:39:59', '2022-09-29 17:39:59'),
(62, 13, 3, 5, 'Israel Salguero, se ha creado el caso.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-29 17:39:59', '2022-09-29 23:43:24'),
(63, 2, 4, 3, 'Israel Salguero your invoice has been Pagado', NULL, NULL, NULL, '2022-09-29 17:41:02', '2022-09-29 17:41:02'),
(64, 2, 3, 5, 'Israel Salguero invoice has been Pagado', NULL, NULL, '2022-09-29 23:43:24', '2022-09-29 17:41:02', '2022-09-29 23:43:24'),
(65, 15, 2, 2, 'New notice board added.', NULL, NULL, '2022-09-29 17:44:21', '2022-09-29 17:41:30', '2022-09-29 17:44:21'),
(66, 15, 4, 3, 'New notice board added.', NULL, NULL, NULL, '2022-09-29 17:41:30', '2022-09-29 17:41:30'),
(67, 15, 5, 4, 'New notice board added.', NULL, NULL, NULL, '2022-09-29 17:41:30', '2022-09-29 17:41:30'),
(68, 15, 3, 5, 'New notice board added.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-29 17:41:30', '2022-09-29 23:43:24'),
(69, 15, 4, 6, 'New notice board added.', NULL, NULL, NULL, '2022-09-29 17:41:30', '2022-09-29 17:41:30'),
(70, 15, 2, 7, 'New notice board added.', NULL, NULL, NULL, '2022-09-29 17:41:30', '2022-09-29 17:41:30'),
(71, 15, 4, 8, 'New notice board added.', NULL, NULL, NULL, '2022-09-29 17:41:30', '2022-09-29 17:41:30'),
(72, 15, 2, 11, 'New notice board added.', NULL, NULL, NULL, '2022-09-29 17:41:30', '2022-09-29 17:41:30'),
(73, 15, 2, 2, 'Añadido nuevo tablón de anuncios.', NULL, NULL, NULL, '2022-09-29 17:44:56', '2022-09-29 17:44:56'),
(74, 15, 4, 3, 'Añadido nuevo tablón de anuncios.', NULL, NULL, NULL, '2022-09-29 17:44:56', '2022-09-29 17:44:56'),
(75, 15, 5, 4, 'Añadido nuevo tablón de anuncios.', NULL, NULL, NULL, '2022-09-29 17:44:56', '2022-09-29 17:44:56'),
(76, 15, 3, 5, 'Añadido nuevo tablón de anuncios.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-29 17:44:56', '2022-09-29 23:43:24'),
(77, 15, 4, 6, 'Añadido nuevo tablón de anuncios.', NULL, NULL, NULL, '2022-09-29 17:44:56', '2022-09-29 17:44:56'),
(78, 15, 2, 7, 'Añadido nuevo tablón de anuncios.', NULL, NULL, NULL, '2022-09-29 17:44:56', '2022-09-29 17:44:56'),
(79, 15, 4, 8, 'Añadido nuevo tablón de anuncios.', NULL, NULL, NULL, '2022-09-29 17:44:56', '2022-09-29 17:44:56'),
(80, 15, 2, 11, 'Añadido nuevo tablón de anuncios.', NULL, NULL, NULL, '2022-09-29 17:44:56', '2022-09-29 17:44:56'),
(81, 15, 2, 2, 'Añadido nuevo tablón de anuncios.', NULL, NULL, NULL, '2022-09-29 18:25:42', '2022-09-29 18:25:42'),
(82, 15, 4, 3, 'Añadido nuevo tablón de anuncios.', NULL, NULL, NULL, '2022-09-29 18:25:42', '2022-09-29 18:25:42'),
(83, 15, 5, 4, 'Añadido nuevo tablón de anuncios.', NULL, NULL, NULL, '2022-09-29 18:25:42', '2022-09-29 18:25:42'),
(84, 15, 3, 5, 'Añadido nuevo tablón de anuncios.', NULL, NULL, '2022-09-29 23:43:24', '2022-09-29 18:25:42', '2022-09-29 23:43:24'),
(85, 15, 4, 6, 'Añadido nuevo tablón de anuncios.', NULL, NULL, NULL, '2022-09-29 18:25:42', '2022-09-29 18:25:42'),
(86, 15, 2, 7, 'Añadido nuevo tablón de anuncios.', NULL, NULL, NULL, '2022-09-29 18:25:43', '2022-09-29 18:25:43'),
(87, 15, 4, 8, 'Añadido nuevo tablón de anuncios.', NULL, NULL, NULL, '2022-09-29 18:25:43', '2022-09-29 18:25:43'),
(88, 15, 2, 11, 'Añadido nuevo tablón de anuncios.', NULL, NULL, NULL, '2022-09-29 18:25:43', '2022-09-29 18:25:43'),
(89, 4, 4, 3, 'Israel Salguero your IPD record has been created.', NULL, NULL, NULL, '2022-09-30 00:19:59', '2022-09-30 00:19:59'),
(90, 4, 4, 6, 'Juan Pinto your IPD record has been created.', NULL, NULL, NULL, '2022-09-30 00:22:24', '2022-09-30 00:22:24'),
(91, 4, 4, 6, 'Juan Pinto your IPD record has been created.', NULL, NULL, NULL, '2022-09-30 00:35:31', '2022-09-30 00:35:31'),
(92, 4, 4, 6, 'Juan Pinto your IPD record has been created.', NULL, NULL, NULL, '2022-09-30 00:43:13', '2022-09-30 00:43:13'),
(93, 4, 4, 6, 'Juan Pinto your IPD record has been created.', NULL, NULL, NULL, '2022-09-30 00:47:18', '2022-09-30 00:47:18'),
(94, 4, 4, 3, 'Israel Salguero your IPD record has been created.', NULL, NULL, NULL, '2022-09-30 00:48:25', '2022-09-30 00:48:25'),
(95, 8, 2, 2, 'Juan Pinto IPD prescription has been created.', NULL, NULL, NULL, '2022-09-30 23:16:32', '2022-09-30 23:16:32'),
(96, 8, 4, 6, 'Juan Pinto your IPD prescription has been created.', NULL, NULL, NULL, '2022-09-30 23:16:32', '2022-09-30 23:16:32'),
(97, 10, 2, 2, 'Adalid Llanos Martínez your employee payroll has been created.', NULL, NULL, NULL, '2022-10-04 13:40:09', '2022-10-04 13:40:09'),
(98, 10, 5, 4, 'Juana Coro your employee payroll has been created.', NULL, NULL, NULL, '2022-10-04 13:59:57', '2022-10-04 13:59:57'),
(99, 1, 2, 2, 'Ramiro Alvarez, la cita ha sido reservada.', NULL, NULL, NULL, '2022-10-04 21:03:06', '2022-10-04 21:03:06'),
(100, 1, 4, 12, 'Ramiro Alvarez your appointment has been booked.', NULL, NULL, NULL, '2022-10-04 21:03:06', '2022-10-04 21:03:06'),
(101, 1, 3, 5, 'Ramiro Alvarez, la cita ha sido reservada.', NULL, NULL, NULL, '2022-10-04 21:03:06', '2022-10-04 21:03:06'),
(102, 4, 4, 6, 'Juan Pinto your IPD record has been created.', NULL, NULL, NULL, '2022-10-05 13:57:56', '2022-10-05 13:57:56'),
(103, 10, 5, 4, 'Juana Coro your employee payroll has been created.', NULL, NULL, NULL, '2022-10-05 20:43:19', '2022-10-05 20:43:19'),
(104, 4, 4, 3, 'Israel Salguero your IPD record has been created.', NULL, NULL, NULL, '2022-10-06 12:49:06', '2022-10-06 12:49:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nurses`
--

CREATE TABLE `nurses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `nurses`
--

INSERT INTO `nurses` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 4, '2022-09-12 19:11:38', '2022-09-12 19:11:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opd_diagnoses`
--

CREATE TABLE `opd_diagnoses` (
  `id` int(10) UNSIGNED NOT NULL,
  `opd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `report_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_date` datetime NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opd_patient_departments`
--

CREATE TABLE `opd_patient_departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `opd_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symptoms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appointment_date` datetime NOT NULL,
  `case_id` int(10) UNSIGNED DEFAULT NULL,
  `is_old_patient` tinyint(1) DEFAULT 0,
  `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `standard_charge` double NOT NULL,
  `payment_mode` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opd_timelines`
--

CREATE TABLE `opd_timelines` (
  `id` int(10) UNSIGNED NOT NULL,
  `opd_patient_department_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible_to_person` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operation_reports`
--

CREATE TABLE `operation_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `case_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `operation_reports`
--

INSERT INTO `operation_reports` (`id`, `patient_id`, `case_id`, `doctor_id`, `date`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'IDAKVCXG', 1, '2022-09-19 20:32:00', NULL, '2022-09-20 00:32:46', '2022-09-20 00:32:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` double NOT NULL,
  `total_amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `packages`
--

INSERT INTO `packages` (`id`, `name`, `description`, `discount`, `total_amount`, `created_at`, `updated_at`) VALUES
(1, 'Curación', NULL, 0, 2, '2022-09-19 22:10:37', '2022-09-23 19:06:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `package_services`
--

CREATE TABLE `package_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `rate` double NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `package_services`
--

INSERT INTO `package_services` (`id`, `package_id`, `service_id`, `quantity`, `rate`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 1, 2, 2, '2022-09-19 22:10:37', '2022-09-23 19:06:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pathology_categories`
--

CREATE TABLE `pathology_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pathology_categories`
--

INSERT INTO `pathology_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Hemograma', '2022-09-20 22:20:48', '2022-09-23 16:29:37'),
(2, 'Coagulograma', '2022-09-23 16:30:37', '2022-09-23 16:30:37'),
(3, 'Química Sanguínea', '2022-09-23 16:31:10', '2022-09-23 16:31:10'),
(4, 'Perfil Lipídico', '2022-09-23 18:44:49', '2022-09-23 18:44:49'),
(5, 'Enzimas Cardiacas', '2022-09-23 18:45:09', '2022-09-23 18:45:09'),
(6, 'Electrolitos', '2022-09-23 18:45:29', '2022-09-23 18:45:29'),
(7, 'Inmunoserología', '2022-09-23 18:46:07', '2022-09-23 18:46:07'),
(8, 'Diagnóstico de Embarazo', '2022-09-23 18:46:40', '2022-09-23 18:46:40'),
(9, 'Hormonas', '2022-09-23 18:46:52', '2022-09-23 18:46:52'),
(10, 'Marcadores Tumorales', '2022-09-23 18:47:15', '2022-09-23 18:47:15'),
(11, 'Fármacos y Drogas', '2022-09-23 18:47:34', '2022-09-23 18:47:34'),
(12, 'Urianálisis', '2022-09-23 18:48:07', '2022-09-23 18:48:07'),
(13, 'Coproanálisis', '2022-09-23 18:48:30', '2022-09-23 18:48:30'),
(14, 'Espectoración', '2022-09-23 18:49:15', '2022-09-23 18:49:15'),
(15, 'Microbiología', '2022-09-23 18:49:32', '2022-09-23 18:49:32'),
(16, 'Micología', '2022-09-23 18:49:46', '2022-09-23 18:49:46'),
(17, 'Líquidos Biológicos', '2022-09-23 18:50:03', '2022-09-23 18:50:03'),
(18, 'Citopatología', '2022-09-23 18:50:31', '2022-09-23 18:50:31'),
(19, 'Pruebas de Fertilidad', '2022-09-23 18:50:50', '2022-09-23 18:50:50'),
(20, 'Pruebas Especiales', '2022-09-23 18:51:09', '2022-09-23 18:51:09'),
(21, 'Perfil Pre-Operatorio', '2022-09-23 18:51:38', '2022-09-23 18:51:38'),
(22, 'Perfil Obstétrico', '2022-09-23 18:51:59', '2022-09-23 18:51:59'),
(23, 'Perfil Hepático', '2022-09-23 18:52:17', '2022-09-23 18:52:36'),
(24, 'Perfil Reumatoideo', '2022-09-23 18:52:57', '2022-09-23 18:52:57'),
(25, 'Gasometría', '2022-09-23 18:53:14', '2022-09-23 18:53:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pathology_tests`
--

CREATE TABLE `pathology_tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `test_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `subcategory` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_days` int(11) DEFAULT NULL,
  `charge_category_id` int(10) UNSIGNED DEFAULT NULL,
  `standard_charge` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pathology_tests`
--

INSERT INTO `pathology_tests` (`id`, `patient_id`, `doctor_id`, `test_name`, `short_name`, `test_type`, `category_id`, `unit`, `subcategory`, `method`, `report_days`, `charge_category_id`, `standard_charge`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'ososososo', '', 'xscdsc', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-20 22:21:40', '2022-09-20 22:21:40'),
(2, 3, 2, 'xwdxd', '', '1.- dedee\r\n2.- frfe\r\n3.- eferc', 1, NULL, NULL, NULL, 1, NULL, NULL, '2022-09-20 23:34:02', '2022-09-20 23:34:02'),
(3, 1, 3, 'xexexee', '', 'xexe', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-29 17:56:58', '2022-09-29 17:56:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patients`
--

CREATE TABLE `patients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `patients`
--

INSERT INTO `patients` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, '2022-09-12 18:40:39', '2022-09-12 18:40:39'),
(2, 6, '2022-09-13 22:15:43', '2022-09-13 22:15:43'),
(3, 8, '2022-09-19 15:32:08', '2022-09-19 15:32:08'),
(6, 12, '2022-09-29 19:38:14', '2022-09-29 19:38:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patient_admissions`
--

CREATE TABLE `patient_admissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_admission_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `admission_date` datetime NOT NULL,
  `discharge_date` datetime DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `insurance_id` int(10) UNSIGNED DEFAULT NULL,
  `bed_id` int(10) UNSIGNED DEFAULT NULL,
  `policy_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian_relation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian_contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `patient_admissions`
--

INSERT INTO `patient_admissions` (`id`, `patient_admission_id`, `patient_id`, `doctor_id`, `admission_date`, `discharge_date`, `package_id`, `insurance_id`, `bed_id`, `policy_no`, `agent_name`, `guardian_name`, `guardian_relation`, `guardian_contact`, `guardian_address`, `status`, `created_at`, `updated_at`) VALUES
(1, 'E4QZWSM0', 1, 1, '2022-09-14 12:00:00', '2022-09-20 12:00:00', NULL, 1, NULL, NULL, NULL, NULL, NULL, '+59177809876', 'vfdvdcd', 1, '2022-09-19 22:37:56', '2022-09-28 21:44:29'),
(2, 'LXEOVVQ1', 3, 3, '2022-09-29 12:00:00', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-09-28 21:45:41', '2022-09-28 21:45:41'),
(3, 'SVAUIYJ8', 1, 1, '2022-09-14 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-09-28 21:47:33', '2022-09-28 21:47:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patient_cases`
--

CREATE TABLE `patient_cases` (
  `id` int(10) UNSIGNED NOT NULL,
  `case_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `fee` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `patient_cases`
--

INSERT INTO `patient_cases` (`id`, `case_id`, `patient_id`, `phone`, `doctor_id`, `date`, `fee`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 'IDAKVCXG', 1, NULL, 1, '2022-09-12 15:05:00', 50, 1, NULL, '2022-09-12 19:07:00', '2022-10-06 12:59:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patient_diagnosis_properties`
--

CREATE TABLE `patient_diagnosis_properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_diagnosis_id` bigint(20) UNSIGNED NOT NULL,
  `property_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `patient_diagnosis_properties`
--

INSERT INTO `patient_diagnosis_properties` (`id`, `patient_diagnosis_id`, `property_name`, `property_value`, `created_at`, `updated_at`) VALUES
(146, 12, 'Tipo_de_sangre', 'O Rh+', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(147, 12, 'Alergias', 'No presenta', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(148, 12, 'Patologías_prevalentes/Cirugias', 'Cirugía de apéndice', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(149, 12, 'Edad', '49', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(150, 12, 'Medicamentos_que_utiliza', 'Enalapril', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(151, 12, 'Observaciones', 'Ninguna', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(152, 12, 'Presión_arterial', '120', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(153, 12, 'F_C_', '25', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(154, 12, 'F_R_', '28', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(155, 12, 'Temperatura', '36', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(156, 12, 'Peso', '0.79', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(157, 12, 'Talla', '1.71', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(158, 12, 'I_M_C_', NULL, '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(159, 12, 'Nota', 'Ninguna', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(160, 12, 'Subjetivo', 'rfreferc', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(161, 12, 'Objetivo', 'dwecwec', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(162, 12, 'Interpretación', 'wcwcw', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(163, 12, 'Plan', 'dwedww', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(164, 13, 'Tipo_de_sangre', NULL, '2022-09-29 17:52:36', '2022-09-29 17:52:36'),
(165, 13, 'Alergias', NULL, '2022-09-29 17:52:36', '2022-09-29 17:52:36'),
(166, 13, 'Patologías_prevalentes/Cirugias', NULL, '2022-09-29 17:52:36', '2022-09-29 17:52:36'),
(167, 13, 'Edad', NULL, '2022-09-29 17:52:36', '2022-09-29 17:52:36'),
(168, 13, 'Medicamentos_que_utiliza', NULL, '2022-09-29 17:52:36', '2022-09-29 17:52:36'),
(169, 13, 'Observaciones', NULL, '2022-09-29 17:52:36', '2022-09-29 17:52:36'),
(170, 13, 'Presión_arterial', NULL, '2022-09-29 17:52:36', '2022-09-29 17:52:36'),
(171, 13, 'FC', NULL, '2022-09-29 17:52:36', '2022-09-29 17:52:36'),
(172, 13, 'FR', NULL, '2022-09-29 17:52:36', '2022-09-29 17:52:36'),
(173, 13, 'Temperatura', NULL, '2022-09-29 17:52:36', '2022-09-29 17:52:36'),
(174, 13, 'Peso', NULL, '2022-09-29 17:52:36', '2022-09-29 17:52:36'),
(175, 13, 'Talla', NULL, '2022-09-29 17:52:36', '2022-09-29 17:52:36'),
(176, 13, 'IMC', NULL, '2022-09-29 17:52:36', '2022-09-29 17:52:36'),
(177, 13, 'Nota', NULL, '2022-09-29 17:52:36', '2022-09-29 17:52:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patient_diagnosis_tests`
--

CREATE TABLE `patient_diagnosis_tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `report_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `patient_diagnosis_tests`
--

INSERT INTO `patient_diagnosis_tests` (`id`, `patient_id`, `doctor_id`, `category_id`, `report_number`, `created_at`, `updated_at`) VALUES
(12, 1, 1, 1, 'DBQNLGE1', '2022-09-19 20:29:18', '2022-09-19 20:29:18'),
(13, 2, 3, 1, 'MQHWI6W4', '2022-09-29 17:52:36', '2022-09-29 17:52:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_date` date NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `pay_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manage_users', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(2, 'manage_beds', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(3, 'manage_wards', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(4, 'manage_appointments', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(5, 'manage_prescriptions', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(6, 'manage_patients', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(7, 'manage_blood_bank', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(8, 'manage_reports', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(9, 'manage_payrolls', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(10, 'manage_settings', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(11, 'manage_notice_board', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(12, 'manage_doctors', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(13, 'manage_nurses', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(14, 'manage_receptionists', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(15, 'manage_pharmacists', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(16, 'manage_accountants', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(17, 'manage_invoices', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(18, 'manage_operations_history', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(19, 'manage_admit_history', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(20, 'manage_blood_donor', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(21, 'manage_medicines', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(22, 'manage_department', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(23, 'manage_doctor_departments', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22'),
(24, 'manage_lab_technicians', 'web', '2021-11-17 07:01:22', '2021-11-17 07:01:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pharmacists`
--

CREATE TABLE `pharmacists` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postals`
--

CREATE TABLE `postals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `food_allergies` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tendency_bleed` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `heart_disease` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `high_blood_pressure` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diabetic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surgery` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accident` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `others` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medical_history` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_medication` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `female_pregnancy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `breast_feeding` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `health_insurance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `low_income` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `radiology_categories`
--

CREATE TABLE `radiology_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `radiology_categories`
--

INSERT INTO `radiology_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Rayos X', '2022-09-20 22:07:47', '2022-09-23 16:31:59'),
(2, 'Tomografía', '2022-09-23 16:32:13', '2022-09-23 16:32:13'),
(3, 'Ecografía', '2022-09-23 16:32:27', '2022-09-23 16:32:27'),
(4, 'Resonancia Magnética', '2022-09-23 16:32:50', '2022-09-23 16:32:50'),
(5, 'Fluoroscopia', '2022-09-23 16:33:13', '2022-09-23 16:33:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `radiology_tests`
--

CREATE TABLE `radiology_tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `test_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `subcategory` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_days` int(11) DEFAULT NULL,
  `charge_category_id` int(10) UNSIGNED DEFAULT NULL,
  `standard_charge` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `radiology_tests`
--

INSERT INTO `radiology_tests` (`id`, `patient_id`, `doctor_id`, `test_name`, `short_name`, `test_type`, `category_id`, `subcategory`, `report_days`, `charge_category_id`, `standard_charge`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'ecesx', '', 'dcecsx', 1, NULL, NULL, NULL, NULL, '2022-09-21 01:43:08', '2022-09-21 01:43:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receptionists`
--

CREATE TABLE `receptionists` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `receptionists`
--

INSERT INTO `receptionists` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 5, '2022-09-12 19:45:42', '2022-09-12 19:45:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(2, 4),
(2, 5),
(3, 1),
(3, 4),
(3, 5),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(6, 1),
(6, 2),
(6, 4),
(6, 5),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(9, 1),
(10, 1),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 5),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(14, 1),
(14, 2),
(14, 3),
(14, 4),
(14, 5),
(15, 1),
(15, 2),
(15, 3),
(15, 4),
(15, 5),
(16, 1),
(17, 1),
(18, 1),
(18, 2),
(18, 4),
(18, 5),
(19, 1),
(19, 3),
(19, 5),
(20, 1),
(20, 2),
(20, 4),
(20, 5),
(21, 1),
(21, 2),
(21, 3),
(21, 4),
(22, 1),
(22, 2),
(22, 4),
(22, 5),
(23, 1),
(24, 1),
(24, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedules`
--

CREATE TABLE `schedules` (
  `id` int(10) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `per_patient_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `schedules`
--

INSERT INTO `schedules` (`id`, `doctor_id`, `per_patient_time`, `created_at`, `updated_at`) VALUES
(4, 1, '00:20:00', '2022-09-20 18:29:17', '2022-09-20 18:29:17'),
(5, 3, '00:20:00', '2022-10-05 13:41:45', '2022-10-05 13:41:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedule_days`
--

CREATE TABLE `schedule_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` int(10) UNSIGNED NOT NULL,
  `available_on` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `available_from` time NOT NULL,
  `available_to` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `schedule_days`
--

INSERT INTO `schedule_days` (`id`, `doctor_id`, `schedule_id`, `available_on`, `available_from`, `available_to`, `created_at`, `updated_at`) VALUES
(22, 1, 4, 'Lunes', '09:00:00', '21:00:00', '2022-09-20 18:29:17', '2022-09-20 18:29:17'),
(23, 1, 4, 'Martes', '09:00:00', '21:00:00', '2022-09-20 18:29:17', '2022-09-20 18:29:17'),
(24, 1, 4, 'Miércoles', '09:00:00', '21:00:00', '2022-09-20 18:29:17', '2022-09-20 18:29:17'),
(25, 1, 4, 'Jueves', '09:00:00', '21:00:00', '2022-09-20 18:29:17', '2022-09-20 18:29:17'),
(26, 1, 4, 'Viernes', '09:00:00', '21:00:00', '2022-09-20 18:29:17', '2022-09-20 18:29:17'),
(27, 1, 4, 'Sábado', '09:00:00', '21:00:00', '2022-09-20 18:29:17', '2022-09-20 18:29:17'),
(28, 1, 4, 'Domingo', '00:00:00', '00:00:00', '2022-09-20 18:29:17', '2022-09-20 18:29:17'),
(29, 3, 5, 'Lunes', '09:00:00', '21:00:00', '2022-10-05 13:41:46', '2022-10-05 13:41:46'),
(30, 3, 5, 'Martes', '09:00:00', '21:00:00', '2022-10-05 13:41:46', '2022-10-05 13:41:46'),
(31, 3, 5, 'Miércoles', '09:00:00', '21:00:00', '2022-10-05 13:41:46', '2022-10-05 13:41:46'),
(32, 3, 5, 'Jueves', '00:00:00', '00:00:00', '2022-10-05 13:41:46', '2022-10-05 13:41:46'),
(33, 3, 5, 'Viernes', '00:00:00', '00:00:00', '2022-10-05 13:41:46', '2022-10-05 13:41:46'),
(34, 3, 5, 'Sábado', '00:00:00', '00:00:00', '2022-10-05 13:41:47', '2022-10-05 13:41:47'),
(35, 3, 5, 'Domingo', '00:00:00', '00:00:00', '2022-10-05 13:41:47', '2022-10-05 13:41:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `quantity`, `rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Inyectable IM', NULL, 10, 2, 1, '2022-09-19 20:54:09', '2022-09-23 18:57:06'),
(2, 'Inyectable EV', NULL, 10, 5, 1, '2022-09-23 18:57:54', '2022-09-23 18:57:54'),
(3, 'Curación Menor', NULL, 10, 10, 1, '2022-09-23 18:59:02', '2022-09-23 18:59:02'),
(4, 'Curación Mediana', NULL, 10, 15, 1, '2022-09-23 19:00:09', '2022-09-23 19:00:09'),
(5, 'Curación Mayor', NULL, 10, 25, 1, '2022-09-23 19:00:47', '2022-09-23 19:00:47'),
(6, 'Sutura por punto', NULL, 10, 4, 1, '2022-09-23 19:01:14', '2022-09-23 19:01:14'),
(7, 'Retiro por punto', NULL, 10, 2, 1, '2022-09-23 19:01:39', '2022-09-23 19:01:39'),
(8, 'Venoclisis', NULL, 10, 12, 1, '2022-09-23 19:02:38', '2022-09-23 19:02:38'),
(9, 'Nebulización', NULL, 10, 15, 1, '2022-09-23 19:03:08', '2022-09-23 19:03:08'),
(10, 'Sonda Vesical', NULL, 10, 15, 1, '2022-09-23 19:03:32', '2022-09-23 19:03:32'),
(11, 'Oxígeno', NULL, 10, 0, 1, '2022-09-23 19:04:07', '2022-09-23 19:04:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'app_name', 'Centro Médico \"Vital\"', '2021-11-17 07:01:22', '2022-09-20 00:42:49'),
(2, 'app_logo', 'http://localhost/uploads/13/logoo.png', '2021-11-17 07:01:22', '2022-09-14 18:44:05'),
(3, 'company_name', 'CMV', '2021-11-17 07:01:22', '2022-09-11 20:50:59'),
(4, 'current_currency', 'usd', '2021-11-17 07:01:22', '2022-09-11 20:51:00'),
(5, 'hospital_address', 'H. Players N° 421 \"A\"', '2021-11-17 07:01:22', '2022-09-11 20:51:00'),
(6, 'hospital_email', 'centrovital@gmail.com', '2021-11-17 07:01:22', '2022-09-11 20:50:59'),
(7, 'hospital_phone', '+59172417150', '2021-11-17 07:01:22', '2022-09-11 20:50:59'),
(8, 'hospital_from_day', 'Lunes a Sábado', '2021-11-17 07:01:22', '2022-09-29 18:16:00'),
(9, 'hospital_from_time', '9:00 AM para 9:00 PM', '2021-11-17 07:01:22', '2022-09-11 20:50:59'),
(10, 'favicon', 'http://hms.test/web/img/favicon.png', '2021-11-17 07:01:23', '2021-11-17 07:01:23'),
(11, 'facebook_url', 'https://www.facebook.com', '2021-11-17 07:01:23', '2022-09-11 20:51:00'),
(12, 'twitter_url', 'https://twitter.com', '2021-11-17 07:01:23', '2022-09-11 20:51:00'),
(13, 'instagram_url', 'https://www.instagram.com', '2021-11-17 07:01:23', '2022-09-11 20:51:00'),
(14, 'linkedIn_url', 'https://www.linkedin.com', '2021-11-17 07:01:23', '2022-09-11 20:51:00'),
(15, 'about_us', 'Garantizar una labor social a los pacientes, brindándoles asistencia médica integral, mediante un excelente servicio y una atención personalizada.', '2021-11-17 07:01:23', '2022-09-13 20:01:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sms`
--

CREATE TABLE `sms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `send_to` bigint(20) UNSIGNED DEFAULT NULL,
  `region_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(2, 'xdx', 'xsx', '2022-09-29 18:27:10', '2022-09-29 18:27:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stripe_transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `qualification` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `owner_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedIn_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `department_id`, `first_name`, `last_name`, `ci`, `occupation`, `email`, `password`, `designation`, `phone`, `gender`, `qualification`, `blood_group`, `dob`, `email_verified_at`, `owner_id`, `owner_type`, `status`, `language`, `remember_token`, `facebook_url`, `twitter_url`, `instagram_url`, `linkedIn_url`, `created_at`, `updated_at`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`) VALUES
(1, 1, 'Super', 'Admin', NULL, NULL, 'admin@hms.com', '$2y$10$FLXOq.6eq10OO.PNerUzRu/NQgUKQQbpNCvlKjsoqlQmuNav5CpG6', NULL, '78784545', 1, NULL, 'B+', '1994-12-12', '2021-11-17 07:01:22', NULL, NULL, 1, 'es', NULL, NULL, NULL, NULL, NULL, '2021-11-17 07:01:22', '2022-09-22 16:08:22', NULL, NULL, NULL, NULL),
(2, 2, 'Adalid', 'Llanos Martínez', NULL, NULL, 'ada@gmail.com', '$2y$10$mWH3gZTC9KQ57wNqmqVcZeMdyrXwIU7Xa8gb.OtbG6sA5Y2XtK/Xi', NULL, '+59172417150', 0, 'Doctor', NULL, '1979-09-19', '2022-09-13 22:19:46', 1, 'App\\Models\\Doctor', 1, 'es', NULL, NULL, NULL, NULL, NULL, '2022-09-11 21:51:47', '2022-09-28 21:29:45', NULL, NULL, NULL, NULL),
(3, 3, 'Israel', 'Salguero', '6567890', 'Abogado', 'irra@gmail.com', '$2y$10$HnWuptwn4jALejGkQMenIuboW3BDmFBul4tatVrk9nOEtQTXc2cvC', NULL, '+59177856789', 0, NULL, 'O+', '2004-03-09', NULL, 1, 'App\\Models\\Patient', 1, 'es', NULL, NULL, NULL, NULL, NULL, '2022-09-12 18:40:36', '2022-09-30 21:37:29', NULL, NULL, NULL, NULL),
(4, 4, 'Juana', 'Coro', NULL, NULL, 'juanita@gmail.com', '$2y$10$Z5Db9bIVc8fYA87KYR21RuWuwcY0zWnHJDft6om/aoPwdnIl2AjMi', NULL, '+59177812470', 0, 'Licenciada', NULL, '1995-05-10', '2022-09-13 23:04:14', 1, 'App\\Models\\Nurse', 1, 'es', NULL, NULL, NULL, NULL, NULL, '2022-09-12 19:11:36', '2022-09-28 22:06:05', NULL, NULL, NULL, NULL),
(5, 5, 'Silvia', 'Loredo', NULL, NULL, 'silvia@gmail.com', '$2y$10$Ya5RPs5q8mV73jPNGOpszew1Rs/sGd1LlkwrDvm.7ZTFiWuacxx42', 'Secretaria', '+59177812000', 1, 'Secretaria', NULL, '1998-09-09', '2022-09-23 23:25:38', 1, 'App\\Models\\Receptionist', 1, 'es', NULL, NULL, NULL, NULL, NULL, '2022-09-12 19:45:40', '2022-10-04 21:00:34', NULL, NULL, NULL, NULL),
(6, 3, 'juan', 'pinto', '65890543', NULL, 'pinto@gmail.com', '$2y$10$zIvF6kX4GT3lARkpHYQ09eQ8HWNuQo3YCntIPtOmXqvapqD6qWWM.', NULL, '+59177834570', 0, NULL, 'A+', NULL, '2022-09-28 20:01:45', 2, 'App\\Models\\Patient', 1, 'es', NULL, NULL, NULL, NULL, NULL, '2022-09-13 22:15:40', '2022-09-28 20:01:45', NULL, NULL, NULL, NULL),
(7, 2, 'José Luis', 'Miranda Calle', '567577777', NULL, 'jose@gmail.com', '$2y$10$V9UtrNEojitK4yGMdXeF5.ntKp/L7tCvfjc1QC8x10Cauxt3cFOTm', NULL, '+59177834780', 0, 'Doctor', NULL, NULL, '2022-09-26 23:16:03', 2, 'App\\Models\\Doctor', 1, 'es', NULL, NULL, NULL, NULL, NULL, '2022-09-13 22:55:02', '2022-09-26 23:16:03', NULL, NULL, NULL, NULL),
(8, 3, 'Lourdes', 'Choque Viscarra', '56345346', 'Profesora', 'luly@gmail.com', '$2y$10$zMgHTf5/U8nA2rXBCO9U4.F2n5D6XoeXagisFWI1HkkDyn9AQgYP6', NULL, '+59177867890', 0, NULL, 'O+', NULL, '2022-09-28 20:00:29', 3, 'App\\Models\\Patient', 1, 'es', NULL, NULL, NULL, NULL, NULL, '2022-09-19 15:32:06', '2022-09-28 20:00:29', NULL, NULL, NULL, NULL),
(11, 2, 'Anna María', 'Delgado Pérez', NULL, NULL, 'mary@gmail.com', '$2y$10$boHvHXZfdf40xNNLlXiesu9R31FERdJTPqMGBN.npRrxvFKIsFvRa', NULL, '+59177456789', 1, 'Doctor', NULL, NULL, '2022-09-26 23:16:06', 3, 'App\\Models\\Doctor', 1, 'es', NULL, NULL, NULL, NULL, NULL, '2022-09-23 16:15:29', '2022-09-28 21:29:20', NULL, NULL, NULL, NULL),
(12, 3, 'ramiro', 'alvarez', NULL, NULL, 'rami@gmail.com', '', NULL, '77867890', 0, NULL, NULL, NULL, '2022-09-29 19:39:49', 6, 'App\\Models\\Patient', 1, 'es', NULL, NULL, NULL, NULL, NULL, '2022-09-29 19:38:14', '2022-09-29 19:39:49', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_zoom_credential`
--

CREATE TABLE `user_zoom_credential` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `zoom_api_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zoom_api_secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vaccinated_patients`
--

CREATE TABLE `vaccinated_patients` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `vaccination_id` int(10) UNSIGNED NOT NULL,
  `vaccination_serial_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dose_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dose_given_date` datetime NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vaccinations`
--

CREATE TABLE `vaccinations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufactured_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitors`
--

CREATE TABLE `visitors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purpose` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_card` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_of_person` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accountants`
--
ALTER TABLE `accountants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountants_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_name_index` (`name`);

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `advanced_payments`
--
ALTER TABLE `advanced_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advanced_payments_patient_id_foreign` (`patient_id`),
  ADD KEY `advanced_payments_amount_index` (`amount`);

--
-- Indices de la tabla `ambulances`
--
ALTER TABLE `ambulances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ambulances_vehicle_number_index` (`vehicle_number`);

--
-- Indices de la tabla `ambulance_calls`
--
ALTER TABLE `ambulance_calls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ambulance_calls_patient_id_foreign` (`patient_id`),
  ADD KEY `ambulance_calls_ambulance_id_foreign` (`ambulance_id`),
  ADD KEY `ambulance_calls_date_index` (`date`);

--
-- Indices de la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `appointments_doctor_id_foreign` (`doctor_id`),
  ADD KEY `appointments_opd_date_index` (`opd_date`),
  ADD KEY `appointments_patient_id_foreign` (`patient_id`),
  ADD KEY `appointments_department_id_foreign` (`department_id`);

--
-- Indices de la tabla `beds`
--
ALTER TABLE `beds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `beds_bed_type_foreign` (`bed_type`),
  ADD KEY `beds_is_available_index` (`is_available`);

--
-- Indices de la tabla `bed_assigns`
--
ALTER TABLE `bed_assigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bed_assigns_bed_id_foreign` (`bed_id`),
  ADD KEY `bed_assigns_patient_id_foreign` (`patient_id`),
  ADD KEY `bed_assigns_created_at_assign_date_index` (`created_at`,`assign_date`),
  ADD KEY `bed_assigns_ipd_patient_department_id_foreign` (`ipd_patient_department_id`);

--
-- Indices de la tabla `bed_types`
--
ALTER TABLE `bed_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bed_types_title_index` (`title`);

--
-- Indices de la tabla `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_patient_id_foreign` (`patient_id`),
  ADD KEY `bills_bill_date_index` (`bill_date`);

--
-- Indices de la tabla `bill_items`
--
ALTER TABLE `bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_items_bill_id_foreign` (`bill_id`);

--
-- Indices de la tabla `birth_reports`
--
ALTER TABLE `birth_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `birth_reports_patient_id_foreign` (`patient_id`),
  ADD KEY `birth_reports_doctor_id_foreign` (`doctor_id`),
  ADD KEY `birth_reports_date_index` (`date`);

--
-- Indices de la tabla `blood_banks`
--
ALTER TABLE `blood_banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blood_banks_remained_bags_index` (`remained_bags`);

--
-- Indices de la tabla `blood_donations`
--
ALTER TABLE `blood_donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blood_donations_blood_donor_id_foreign` (`blood_donor_id`);

--
-- Indices de la tabla `blood_donors`
--
ALTER TABLE `blood_donors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blood_donors_created_at_last_donate_date_index` (`created_at`,`last_donate_date`);

--
-- Indices de la tabla `blood_issues`
--
ALTER TABLE `blood_issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blood_issues_doctor_id_foreign` (`doctor_id`),
  ADD KEY `blood_issues_donor_id_foreign` (`donor_id`),
  ADD KEY `blood_issues_patient_id_foreign` (`patient_id`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_name_index` (`name`);

--
-- Indices de la tabla `call_logs`
--
ALTER TABLE `call_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `case_handlers`
--
ALTER TABLE `case_handlers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `case_handlers_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_name_index` (`name`);

--
-- Indices de la tabla `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `charges_charge_category_id_foreign` (`charge_category_id`),
  ADD KEY `charges_code_index` (`code`);

--
-- Indices de la tabla `charge_categories`
--
ALTER TABLE `charge_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `charge_categories_name_index` (`name`);

--
-- Indices de la tabla `death_reports`
--
ALTER TABLE `death_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `death_reports_patient_id_foreign` (`patient_id`),
  ADD KEY `death_reports_doctor_id_foreign` (`doctor_id`),
  ADD KEY `death_reports_date_index` (`date`);

--
-- Indices de la tabla `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `diagnosis_categories`
--
ALTER TABLE `diagnosis_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diagnosis_categories_name_index` (`name`);

--
-- Indices de la tabla `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctors_user_id_foreign` (`user_id`),
  ADD KEY `doctors_doctor_department_id_foreign` (`doctor_department_id`);

--
-- Indices de la tabla `doctor_departments`
--
ALTER TABLE `doctor_departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_departments_title_index` (`title`);

--
-- Indices de la tabla `doctor_opd_charges`
--
ALTER TABLE `doctor_opd_charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_opd_charges_doctor_id_foreign` (`doctor_id`),
  ADD KEY `doctor_opd_charges_created_at_index` (`created_at`);

--
-- Indices de la tabla `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_uploaded_by_foreign` (`uploaded_by`);

--
-- Indices de la tabla `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_types_name_index` (`name`);

--
-- Indices de la tabla `employee_payrolls`
--
ALTER TABLE `employee_payrolls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_payrolls_id_sr_no_index` (`id`,`sr_no`);

--
-- Indices de la tabla `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enquiries_viewed_by_foreign` (`viewed_by`),
  ADD KEY `enquiries_created_at_index` (`created_at`);

--
-- Indices de la tabla `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_date_index` (`date`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `front_services`
--
ALTER TABLE `front_services`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `front_settings`
--
ALTER TABLE `front_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hospital_schedules`
--
ALTER TABLE `hospital_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `incomes_date_index` (`date`);

--
-- Indices de la tabla `insurances`
--
ALTER TABLE `insurances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `insurances_name_index` (`name`);

--
-- Indices de la tabla `insurance_diseases`
--
ALTER TABLE `insurance_diseases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `insurance_diseases_insurance_id_foreign` (`insurance_id`);

--
-- Indices de la tabla `investigation_reports`
--
ALTER TABLE `investigation_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investigation_reports_patient_id_foreign` (`patient_id`),
  ADD KEY `investigation_reports_doctor_id_foreign` (`doctor_id`),
  ADD KEY `investigation_reports_date_index` (`date`);

--
-- Indices de la tabla `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_patient_id_foreign` (`patient_id`),
  ADD KEY `invoices_invoice_date_index` (`invoice_date`);

--
-- Indices de la tabla `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_account_id_foreign` (`account_id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`);

--
-- Indices de la tabla `ipd_bills`
--
ALTER TABLE `ipd_bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_bills_ipd_patient_department_id_foreign` (`ipd_patient_department_id`);

--
-- Indices de la tabla `ipd_charges`
--
ALTER TABLE `ipd_charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_charges_ipd_patient_department_id_foreign` (`ipd_patient_department_id`),
  ADD KEY `ipd_charges_charge_category_id_foreign` (`charge_category_id`),
  ADD KEY `ipd_charges_charge_id_foreign` (`charge_id`);

--
-- Indices de la tabla `ipd_consultant_registers`
--
ALTER TABLE `ipd_consultant_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_consultant_registers_ipd_patient_department_id_foreign` (`ipd_patient_department_id`),
  ADD KEY `ipd_consultant_registers_doctor_id_foreign` (`doctor_id`);

--
-- Indices de la tabla `ipd_diagnoses`
--
ALTER TABLE `ipd_diagnoses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_diagnoses_ipd_patient_department_id_foreign` (`ipd_patient_department_id`);

--
-- Indices de la tabla `ipd_patient_departments`
--
ALTER TABLE `ipd_patient_departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ipd_patient_departments_ipd_number_unique` (`ipd_number`),
  ADD KEY `ipd_patient_departments_patient_id_foreign` (`patient_id`),
  ADD KEY `ipd_patient_departments_case_id_foreign` (`case_id`),
  ADD KEY `ipd_patient_departments_doctor_id_foreign` (`doctor_id`),
  ADD KEY `ipd_patient_departments_bed_type_id_foreign` (`bed_type_id`),
  ADD KEY `ipd_patient_departments_bed_id_foreign` (`bed_id`);

--
-- Indices de la tabla `ipd_payments`
--
ALTER TABLE `ipd_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_payments_ipd_patient_department_id_foreign` (`ipd_patient_department_id`);

--
-- Indices de la tabla `ipd_prescriptions`
--
ALTER TABLE `ipd_prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_prescriptions_ipd_patient_department_id_foreign` (`ipd_patient_department_id`);

--
-- Indices de la tabla `ipd_prescription_items`
--
ALTER TABLE `ipd_prescription_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_prescription_items_ipd_prescription_id_foreign` (`ipd_prescription_id`),
  ADD KEY `ipd_prescription_items_category_id_foreign` (`category_id`),
  ADD KEY `ipd_prescription_items_medicine_id_foreign` (`medicine_id`);

--
-- Indices de la tabla `ipd_timelines`
--
ALTER TABLE `ipd_timelines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ipd_timelines_ipd_patient_department_id_foreign` (`ipd_patient_department_id`);

--
-- Indices de la tabla `issued_items`
--
ALTER TABLE `issued_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issued_items_department_id_foreign` (`department_id`),
  ADD KEY `issued_items_user_id_foreign` (`user_id`),
  ADD KEY `issued_items_item_category_id_foreign` (`item_category_id`),
  ADD KEY `issued_items_item_id_foreign` (`item_id`);

--
-- Indices de la tabla `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_item_category_id_foreign` (`item_category_id`);

--
-- Indices de la tabla `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_categories_name_unique` (`name`);

--
-- Indices de la tabla `item_stocks`
--
ALTER TABLE `item_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_stocks_item_category_id_foreign` (`item_category_id`),
  ADD KEY `item_stocks_item_id_foreign` (`item_id`);

--
-- Indices de la tabla `lab_technicians`
--
ALTER TABLE `lab_technicians`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lab_technicians_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `live_consultations`
--
ALTER TABLE `live_consultations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `live_consultations_doctor_id_foreign` (`doctor_id`),
  ADD KEY `live_consultations_patient_id_foreign` (`patient_id`);

--
-- Indices de la tabla `live_meetings`
--
ALTER TABLE `live_meetings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `live_meetings_candidates`
--
ALTER TABLE `live_meetings_candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mails`
--
ALTER TABLE `mails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mails_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indices de la tabla `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medicines_category_id_foreign` (`category_id`),
  ADD KEY `medicines_brand_id_foreign` (`brand_id`),
  ADD KEY `medicines_name_index` (`name`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notice_boards`
--
ALTER TABLE `notice_boards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notice_boards_created_at_id_index` (`created_at`,`id`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `nurses`
--
ALTER TABLE `nurses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nurses_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `opd_diagnoses`
--
ALTER TABLE `opd_diagnoses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `opd_diagnoses_opd_patient_department_id_foreign` (`opd_patient_department_id`);

--
-- Indices de la tabla `opd_patient_departments`
--
ALTER TABLE `opd_patient_departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `opd_patient_departments_opd_number_unique` (`opd_number`),
  ADD KEY `opd_patient_departments_patient_id_foreign` (`patient_id`),
  ADD KEY `opd_patient_departments_case_id_foreign` (`case_id`),
  ADD KEY `opd_patient_departments_doctor_id_foreign` (`doctor_id`);

--
-- Indices de la tabla `opd_timelines`
--
ALTER TABLE `opd_timelines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `opd_timelines_opd_patient_department_id_foreign` (`opd_patient_department_id`);

--
-- Indices de la tabla `operation_reports`
--
ALTER TABLE `operation_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operation_reports_doctor_id_foreign` (`doctor_id`),
  ADD KEY `operation_reports_patient_id_foreign` (`patient_id`),
  ADD KEY `operation_reports_date_index` (`date`);

--
-- Indices de la tabla `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_created_at_name_index` (`created_at`,`name`);

--
-- Indices de la tabla `package_services`
--
ALTER TABLE `package_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_services_package_id_foreign` (`package_id`),
  ADD KEY `package_services_service_id_foreign` (`service_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `pathology_categories`
--
ALTER TABLE `pathology_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pathology_categories_name_unique` (`name`),
  ADD KEY `pathology_categories_name_index` (`name`);

--
-- Indices de la tabla `pathology_tests`
--
ALTER TABLE `pathology_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pathology_tests_category_id_foreign` (`category_id`),
  ADD KEY `pathology_tests_charge_category_id_foreign` (`charge_category_id`),
  ADD KEY `pathology_tests_test_name_index` (`test_name`);

--
-- Indices de la tabla `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patients_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `patient_admissions`
--
ALTER TABLE `patient_admissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_admissions_patient_admission_id_unique` (`patient_admission_id`),
  ADD KEY `patient_admissions_patient_id_foreign` (`patient_id`),
  ADD KEY `patient_admissions_doctor_id_foreign` (`doctor_id`),
  ADD KEY `patient_admissions_package_id_foreign` (`package_id`),
  ADD KEY `patient_admissions_insurance_id_foreign` (`insurance_id`),
  ADD KEY `patient_admissions_bed_id_foreign` (`bed_id`),
  ADD KEY `patient_admissions_admission_date_index` (`admission_date`);

--
-- Indices de la tabla `patient_cases`
--
ALTER TABLE `patient_cases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_cases_case_id_unique` (`case_id`),
  ADD KEY `patient_cases_patient_id_foreign` (`patient_id`),
  ADD KEY `patient_cases_doctor_id_foreign` (`doctor_id`),
  ADD KEY `patient_cases_date_index` (`date`);

--
-- Indices de la tabla `patient_diagnosis_properties`
--
ALTER TABLE `patient_diagnosis_properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_diagnosis_properties_created_at_index` (`created_at`),
  ADD KEY `patient_diagnosis_properties_patient_diagnosis_id_foreign` (`patient_diagnosis_id`);

--
-- Indices de la tabla `patient_diagnosis_tests`
--
ALTER TABLE `patient_diagnosis_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_diagnosis_tests_created_at_index` (`created_at`),
  ADD KEY `patient_diagnosis_tests_patient_id_foreign` (`patient_id`),
  ADD KEY `patient_diagnosis_tests_doctor_id_foreign` (`doctor_id`),
  ADD KEY `patient_diagnosis_tests_category_id_foreign` (`category_id`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_account_id_foreign` (`account_id`),
  ADD KEY `payments_payment_date_index` (`payment_date`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pharmacists`
--
ALTER TABLE `pharmacists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharmacists_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `postals`
--
ALTER TABLE `postals`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescriptions_patient_id_foreign` (`patient_id`),
  ADD KEY `prescriptions_doctor_id_foreign` (`doctor_id`);

--
-- Indices de la tabla `radiology_categories`
--
ALTER TABLE `radiology_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `radiology_categories_name_unique` (`name`),
  ADD KEY `radiology_categories_name_index` (`name`);

--
-- Indices de la tabla `radiology_tests`
--
ALTER TABLE `radiology_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `radiology_tests_category_id_foreign` (`category_id`),
  ADD KEY `radiology_tests_charge_category_id_foreign` (`charge_category_id`),
  ADD KEY `radiology_tests_test_name_index` (`test_name`);

--
-- Indices de la tabla `receptionists`
--
ALTER TABLE `receptionists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receptionists_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedules_doctor_id_foreign` (`doctor_id`);

--
-- Indices de la tabla `schedule_days`
--
ALTER TABLE `schedule_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_days_doctor_id_foreign` (`doctor_id`),
  ADD KEY `schedule_days_schedule_id_foreign` (`schedule_id`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_name_index` (`name`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_send_to_foreign` (`send_to`),
  ADD KEY `sms_send_by_foreign` (`send_by`);

--
-- Indices de la tabla `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indices de la tabla `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_plan_unique` (`subscription_id`,`stripe_plan`),
  ADD KEY `subscription_items_stripe_id_index` (`stripe_id`);

--
-- Indices de la tabla `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`),
  ADD KEY `users_first_name_index` (`first_name`);

--
-- Indices de la tabla `user_zoom_credential`
--
ALTER TABLE `user_zoom_credential`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_zoom_credential_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `vaccinated_patients`
--
ALTER TABLE `vaccinated_patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vaccinated_patients_id_index` (`id`),
  ADD KEY `vaccinated_patients_patient_id_index` (`patient_id`),
  ADD KEY `vaccinated_patients_vaccination_id_index` (`vaccination_id`);

--
-- Indices de la tabla `vaccinations`
--
ALTER TABLE `vaccinations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vaccinations_id_index` (`id`);

--
-- Indices de la tabla `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accountants`
--
ALTER TABLE `accountants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `advanced_payments`
--
ALTER TABLE `advanced_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ambulances`
--
ALTER TABLE `ambulances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ambulance_calls`
--
ALTER TABLE `ambulance_calls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `beds`
--
ALTER TABLE `beds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bed_assigns`
--
ALTER TABLE `bed_assigns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bed_types`
--
ALTER TABLE `bed_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `bill_items`
--
ALTER TABLE `bill_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `birth_reports`
--
ALTER TABLE `birth_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `blood_banks`
--
ALTER TABLE `blood_banks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `blood_donations`
--
ALTER TABLE `blood_donations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `blood_donors`
--
ALTER TABLE `blood_donors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `blood_issues`
--
ALTER TABLE `blood_issues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `call_logs`
--
ALTER TABLE `call_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `case_handlers`
--
ALTER TABLE `case_handlers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `charge_categories`
--
ALTER TABLE `charge_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `death_reports`
--
ALTER TABLE `death_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `diagnosis_categories`
--
ALTER TABLE `diagnosis_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `doctor_departments`
--
ALTER TABLE `doctor_departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `doctor_opd_charges`
--
ALTER TABLE `doctor_opd_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `document_types`
--
ALTER TABLE `document_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `employee_payrolls`
--
ALTER TABLE `employee_payrolls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `front_services`
--
ALTER TABLE `front_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `front_settings`
--
ALTER TABLE `front_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `hospital_schedules`
--
ALTER TABLE `hospital_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `insurances`
--
ALTER TABLE `insurances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `insurance_diseases`
--
ALTER TABLE `insurance_diseases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `investigation_reports`
--
ALTER TABLE `investigation_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ipd_bills`
--
ALTER TABLE `ipd_bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ipd_charges`
--
ALTER TABLE `ipd_charges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ipd_consultant_registers`
--
ALTER TABLE `ipd_consultant_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ipd_diagnoses`
--
ALTER TABLE `ipd_diagnoses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ipd_patient_departments`
--
ALTER TABLE `ipd_patient_departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ipd_payments`
--
ALTER TABLE `ipd_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ipd_prescriptions`
--
ALTER TABLE `ipd_prescriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ipd_prescription_items`
--
ALTER TABLE `ipd_prescription_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ipd_timelines`
--
ALTER TABLE `ipd_timelines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `issued_items`
--
ALTER TABLE `issued_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `item_stocks`
--
ALTER TABLE `item_stocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lab_technicians`
--
ALTER TABLE `lab_technicians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `live_consultations`
--
ALTER TABLE `live_consultations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `live_meetings`
--
ALTER TABLE `live_meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `live_meetings_candidates`
--
ALTER TABLE `live_meetings_candidates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mails`
--
ALTER TABLE `mails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT de la tabla `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `notice_boards`
--
ALTER TABLE `notice_boards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `nurses`
--
ALTER TABLE `nurses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `opd_diagnoses`
--
ALTER TABLE `opd_diagnoses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `opd_patient_departments`
--
ALTER TABLE `opd_patient_departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `opd_timelines`
--
ALTER TABLE `opd_timelines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `operation_reports`
--
ALTER TABLE `operation_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `package_services`
--
ALTER TABLE `package_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pathology_categories`
--
ALTER TABLE `pathology_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `pathology_tests`
--
ALTER TABLE `pathology_tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `patient_admissions`
--
ALTER TABLE `patient_admissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `patient_cases`
--
ALTER TABLE `patient_cases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `patient_diagnosis_properties`
--
ALTER TABLE `patient_diagnosis_properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT de la tabla `patient_diagnosis_tests`
--
ALTER TABLE `patient_diagnosis_tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `pharmacists`
--
ALTER TABLE `pharmacists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `postals`
--
ALTER TABLE `postals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `radiology_categories`
--
ALTER TABLE `radiology_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `radiology_tests`
--
ALTER TABLE `radiology_tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `receptionists`
--
ALTER TABLE `receptionists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `schedule_days`
--
ALTER TABLE `schedule_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `sms`
--
ALTER TABLE `sms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `user_zoom_credential`
--
ALTER TABLE `user_zoom_credential`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vaccinated_patients`
--
ALTER TABLE `vaccinated_patients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vaccinations`
--
ALTER TABLE `vaccinations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accountants`
--
ALTER TABLE `accountants`
  ADD CONSTRAINT `accountants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `advanced_payments`
--
ALTER TABLE `advanced_payments`
  ADD CONSTRAINT `advanced_payments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `ambulance_calls`
--
ALTER TABLE `ambulance_calls`
  ADD CONSTRAINT `ambulance_calls_ambulance_id_foreign` FOREIGN KEY (`ambulance_id`) REFERENCES `ambulances` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ambulance_calls_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `doctor_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `beds`
--
ALTER TABLE `beds`
  ADD CONSTRAINT `beds_bed_type_foreign` FOREIGN KEY (`bed_type`) REFERENCES `bed_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bed_assigns`
--
ALTER TABLE `bed_assigns`
  ADD CONSTRAINT `bed_assigns_bed_id_foreign` FOREIGN KEY (`bed_id`) REFERENCES `beds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bed_assigns_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bed_assigns_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bill_items`
--
ALTER TABLE `bill_items`
  ADD CONSTRAINT `bill_items_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `birth_reports`
--
ALTER TABLE `birth_reports`
  ADD CONSTRAINT `birth_reports_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `birth_reports_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `blood_donations`
--
ALTER TABLE `blood_donations`
  ADD CONSTRAINT `blood_donations_blood_donor_id_foreign` FOREIGN KEY (`blood_donor_id`) REFERENCES `blood_donors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `blood_issues`
--
ALTER TABLE `blood_issues`
  ADD CONSTRAINT `blood_issues_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `blood_issues_donor_id_foreign` FOREIGN KEY (`donor_id`) REFERENCES `blood_donors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `blood_issues_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `case_handlers`
--
ALTER TABLE `case_handlers`
  ADD CONSTRAINT `case_handlers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `charges`
--
ALTER TABLE `charges`
  ADD CONSTRAINT `charges_charge_category_id_foreign` FOREIGN KEY (`charge_category_id`) REFERENCES `charge_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `death_reports`
--
ALTER TABLE `death_reports`
  ADD CONSTRAINT `death_reports_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `death_reports_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_doctor_department_id_foreign` FOREIGN KEY (`doctor_department_id`) REFERENCES `doctor_departments` (`id`),
  ADD CONSTRAINT `doctors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `doctor_opd_charges`
--
ALTER TABLE `doctor_opd_charges`
  ADD CONSTRAINT `doctor_opd_charges_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_uploaded_by_foreign` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `enquiries`
--
ALTER TABLE `enquiries`
  ADD CONSTRAINT `enquiries_viewed_by_foreign` FOREIGN KEY (`viewed_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `insurance_diseases`
--
ALTER TABLE `insurance_diseases`
  ADD CONSTRAINT `insurance_diseases_insurance_id_foreign` FOREIGN KEY (`insurance_id`) REFERENCES `insurances` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `investigation_reports`
--
ALTER TABLE `investigation_reports`
  ADD CONSTRAINT `investigation_reports_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `investigation_reports_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ipd_bills`
--
ALTER TABLE `ipd_bills`
  ADD CONSTRAINT `ipd_bills_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ipd_charges`
--
ALTER TABLE `ipd_charges`
  ADD CONSTRAINT `ipd_charges_charge_category_id_foreign` FOREIGN KEY (`charge_category_id`) REFERENCES `charge_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_charges_charge_id_foreign` FOREIGN KEY (`charge_id`) REFERENCES `charges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_charges_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ipd_consultant_registers`
--
ALTER TABLE `ipd_consultant_registers`
  ADD CONSTRAINT `ipd_consultant_registers_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_consultant_registers_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ipd_diagnoses`
--
ALTER TABLE `ipd_diagnoses`
  ADD CONSTRAINT `ipd_diagnoses_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ipd_patient_departments`
--
ALTER TABLE `ipd_patient_departments`
  ADD CONSTRAINT `ipd_patient_departments_bed_id_foreign` FOREIGN KEY (`bed_id`) REFERENCES `beds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_patient_departments_bed_type_id_foreign` FOREIGN KEY (`bed_type_id`) REFERENCES `bed_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_patient_departments_case_id_foreign` FOREIGN KEY (`case_id`) REFERENCES `patient_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_patient_departments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_patient_departments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ipd_payments`
--
ALTER TABLE `ipd_payments`
  ADD CONSTRAINT `ipd_payments_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ipd_prescriptions`
--
ALTER TABLE `ipd_prescriptions`
  ADD CONSTRAINT `ipd_prescriptions_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ipd_prescription_items`
--
ALTER TABLE `ipd_prescription_items`
  ADD CONSTRAINT `ipd_prescription_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_prescription_items_ipd_prescription_id_foreign` FOREIGN KEY (`ipd_prescription_id`) REFERENCES `ipd_prescriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ipd_prescription_items_medicine_id_foreign` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ipd_timelines`
--
ALTER TABLE `ipd_timelines`
  ADD CONSTRAINT `ipd_timelines_ipd_patient_department_id_foreign` FOREIGN KEY (`ipd_patient_department_id`) REFERENCES `ipd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `issued_items`
--
ALTER TABLE `issued_items`
  ADD CONSTRAINT `issued_items_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issued_items_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issued_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issued_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `item_stocks`
--
ALTER TABLE `item_stocks`
  ADD CONSTRAINT `item_stocks_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_stocks_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `lab_technicians`
--
ALTER TABLE `lab_technicians`
  ADD CONSTRAINT `lab_technicians_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `live_consultations`
--
ALTER TABLE `live_consultations`
  ADD CONSTRAINT `live_consultations_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `live_consultations_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mails`
--
ALTER TABLE `mails`
  ADD CONSTRAINT `mails_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `medicines`
--
ALTER TABLE `medicines`
  ADD CONSTRAINT `medicines_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `medicines_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nurses`
--
ALTER TABLE `nurses`
  ADD CONSTRAINT `nurses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `opd_diagnoses`
--
ALTER TABLE `opd_diagnoses`
  ADD CONSTRAINT `opd_diagnoses_opd_patient_department_id_foreign` FOREIGN KEY (`opd_patient_department_id`) REFERENCES `opd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `opd_patient_departments`
--
ALTER TABLE `opd_patient_departments`
  ADD CONSTRAINT `opd_patient_departments_case_id_foreign` FOREIGN KEY (`case_id`) REFERENCES `patient_cases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `opd_patient_departments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `opd_patient_departments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `opd_timelines`
--
ALTER TABLE `opd_timelines`
  ADD CONSTRAINT `opd_timelines_opd_patient_department_id_foreign` FOREIGN KEY (`opd_patient_department_id`) REFERENCES `opd_patient_departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `operation_reports`
--
ALTER TABLE `operation_reports`
  ADD CONSTRAINT `operation_reports_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operation_reports_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `package_services`
--
ALTER TABLE `package_services`
  ADD CONSTRAINT `package_services_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `package_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pathology_tests`
--
ALTER TABLE `pathology_tests`
  ADD CONSTRAINT `pathology_tests_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `pathology_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pathology_tests_charge_category_id_foreign` FOREIGN KEY (`charge_category_id`) REFERENCES `charge_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `patient_admissions`
--
ALTER TABLE `patient_admissions`
  ADD CONSTRAINT `patient_admissions_bed_id_foreign` FOREIGN KEY (`bed_id`) REFERENCES `beds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_admissions_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_admissions_insurance_id_foreign` FOREIGN KEY (`insurance_id`) REFERENCES `insurances` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_admissions_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_admissions_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `patient_cases`
--
ALTER TABLE `patient_cases`
  ADD CONSTRAINT `patient_cases_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_cases_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `patient_diagnosis_properties`
--
ALTER TABLE `patient_diagnosis_properties`
  ADD CONSTRAINT `patient_diagnosis_properties_patient_diagnosis_id_foreign` FOREIGN KEY (`patient_diagnosis_id`) REFERENCES `patient_diagnosis_tests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `patient_diagnosis_tests`
--
ALTER TABLE `patient_diagnosis_tests`
  ADD CONSTRAINT `patient_diagnosis_tests_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `diagnosis_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_diagnosis_tests_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_diagnosis_tests_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pharmacists`
--
ALTER TABLE `pharmacists`
  ADD CONSTRAINT `pharmacists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescriptions_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `radiology_tests`
--
ALTER TABLE `radiology_tests`
  ADD CONSTRAINT `radiology_tests_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `radiology_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `radiology_tests_charge_category_id_foreign` FOREIGN KEY (`charge_category_id`) REFERENCES `charge_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `receptionists`
--
ALTER TABLE `receptionists`
  ADD CONSTRAINT `receptionists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `schedule_days`
--
ALTER TABLE `schedule_days`
  ADD CONSTRAINT `schedule_days_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `schedule_days_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sms`
--
ALTER TABLE `sms`
  ADD CONSTRAINT `sms_send_by_foreign` FOREIGN KEY (`send_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sms_send_to_foreign` FOREIGN KEY (`send_to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_zoom_credential`
--
ALTER TABLE `user_zoom_credential`
  ADD CONSTRAINT `user_zoom_credential_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vaccinated_patients`
--
ALTER TABLE `vaccinated_patients`
  ADD CONSTRAINT `vaccinated_patients_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vaccinated_patients_vaccination_id_foreign` FOREIGN KEY (`vaccination_id`) REFERENCES `vaccinations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
