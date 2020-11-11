-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.14-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla bdtienda.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `cedula` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bdtienda.cliente: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`cedula`, `nombre`) VALUES
	(1010, 'Roman'),
	(1020, 'Andres'),
	(1030, 'Cristian'),
	(1040, 'David'),
	(1050, 'Machis');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla bdtienda.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `cedula` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `cargo` varchar(13) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bdtienda.empleado: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` (`cedula`, `nombre`, `cargo`) VALUES
	(123, 'Platta', 'administrador'),
	(546, 'Greta', 'vendedor'),
	(741, 'Romantron', 'administrador'),
	(852, 'Claudia', 'vendedor'),
	(963, 'Ivan', 'vendedor');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;

-- Volcando estructura para tabla bdtienda.factura
CREATE TABLE IF NOT EXISTS `factura` (
  `numeroFactura` int(10) NOT NULL AUTO_INCREMENT,
  `valorFactura` int(10) NOT NULL,
  `miCliente` int(10) NOT NULL,
  `miEmpleado` int(10) NOT NULL,
  PRIMARY KEY (`numeroFactura`),
  KEY `miCliente` (`miCliente`),
  KEY `miEmpleado` (`miEmpleado`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`miCliente`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`miEmpleado`) REFERENCES `empleado` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bdtienda.factura: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` (`numeroFactura`, `valorFactura`, `miCliente`, `miEmpleado`) VALUES
	(1, 100000, 1010, 963),
	(2, 200000, 1020, 852),
	(3, 300000, 1030, 741),
	(4, 400000, 1040, 123),
	(5, 500000, 1050, 546),
	(6, 250000, 1020, 741),
	(7, 150000, 1040, 741),
	(8, 600000, 1050, 963),
	(9, 425000, 1020, 741);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
