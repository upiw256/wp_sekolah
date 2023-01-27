<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'cms_sekolah' );

/** Database username */
define( 'DB_USER', 'root' );

/** Database password */
define( 'DB_PASSWORD', '5414450' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         ']=d6KdKT@|B=x1^J*bcJpms G**$B<qP)~q%,(v.L>~ork0U,b??bjYI]K`$3ef4' );
define( 'SECURE_AUTH_KEY',  'bikH<eAh5(xq/}fuA1&g~ih; ioX?Sd3b>b]U4tQcNzcJ~H,`w:S04qyjW-M*YK_' );
define( 'LOGGED_IN_KEY',    'WUtA|SAL(4DKXi@^UBm`:&u!|szO0^v_-;vm[U1*,4D8?uSH1V5N$FMuraxDv&<v' );
define( 'NONCE_KEY',        '7tH&L%4NEm%chs=IO?WVFxCx@]l[R?;i:dn7RlGEmykoT[lN!]6)+w[tX^WZdp`O' );
define( 'AUTH_SALT',        'A#)*Kiz^e:GL>QEe5[e8@f80iX9+[/{=,r@[ cqg?L/gNssm{cVwD},g5KIIR3O%' );
define( 'SECURE_AUTH_SALT', '|r{vDYXe<mH</|MGgF`Gc(G< TrAk *C*Zs~3z3D*p# MF1yk8d-W~1 6!`|yO^Q' );
define( 'LOGGED_IN_SALT',   'WrNy^V*Z<CTNbV<X@ s`-[s6t8^MkR$>6xDQOoN<_E|7v(byf79T7#5$nBU_OX$=' );
define( 'NONCE_SALT',       '>lS&+vT)*`IqT+gQ1UtW<|wo_@!3&AJ4e*PMG##jt{gktgu$Gh*Y86rH!6C74dY ' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
