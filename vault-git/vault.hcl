/*
 * Vault configuration. See: https://vaultproject.io/docs/config/
 */

ui = true

storage "file" {
	path = "/var/lib/vault"
}

listener "tcp" {
	/*
	 * By default Vault listens on localhost only.
	 * Make sure to enable TLS support otherwise.
	 */
	tls_disable = 1
}
