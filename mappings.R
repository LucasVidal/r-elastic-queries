# Call it like this: apply_map_to_event(map_functions()[,2], e)
apply_map_to_event <- function(function_vector, event) {
  result <- list()
  for (f in function_vector) {
    result <- c(result, f(event))
  }
  data.frame(result)
}

# 2 x N matrix, firts column is name, second is trasformation partial function
map_functions <- function() {
  matrix(
    c(
      "event",                              . %>% extract2("_source") %>% extract2("event"),
      "level",                              . %>% extract2("_source") %>% extract2("level"),
      "message",                            . %>% extract2("_source") %>% extract2("message"),
      "time",                               . %>% extract2("_source") %>% extract2("time"),
      "product",                            . %>% extract2("_source") %>% extract2("product"),
      "i_number_of_devices",                . %>% extract2("_source") %>% extract2("objects") %>% extract2("user") %>% extract2("i_number_of_devices"),
      "s_locale",                           . %>% extract2("_source") %>% extract2("objects") %>% extract2("user") %>% extract2("s_locale"),
      "s_country_code",                     . %>% extract2("_source") %>% extract2("objects") %>% extract2("user") %>% extract2("s_country_code"),
      "s_authy_id",                         . %>% extract2("_source") %>% extract2("objects") %>% extract2("user") %>% extract2("s_authy_id"),
      "i_number_of_accounts",               . %>% extract2("_source") %>% extract2("objects") %>% extract2("user") %>% extract2("i_number_of_accounts"),
      "i_number_of_authy_accounts",         . %>% extract2("_source") %>% extract2("objects") %>% extract2("user") %>% extract2("i_number_of_authy_accounts"),
      "s_account_type",                     . %>% extract2("_source") %>% extract2("objects") %>% extract2("app") %>% extract2("s_account_type"),
      "s_logo_type",                        . %>% extract2("_source") %>% extract2("objects") %>% extract2("app") %>% extract2("s_logo_type"),
      "s_account_provider",                 . %>% extract2("_source") %>% extract2("objects") %>% extract2("app") %>% extract2("s_account_provider"),
      "s_id",                               . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("s_id"),
      "s_app_version",                      . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("s_app_version"),
      "s_anonymous_id",                     . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("s_anonymous_id"),
      "s_user_agent",                       . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("s_user_agent"),
      "s_device_app",                       . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("s_device_app"),
      "s_build_version",                    . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("s_build_version"),
      "b_backups_enabled",                  . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("b_backups_enabled"),
      "s_keychain_error",                   . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("s_keychain_error"),
      "b_multidevice",                      . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("b_multidevice"),
      "s_device_type",                      . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("s_device_type"),
      "s_device_udid",                      . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("s_device_udid"),
      "s_model_name",                       . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("s_model_name"),
      "s_device_manufacturer",              . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("s_device_manufacturer"),
      "s_processor_architecture",           . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("s_processor_architecture"),
      "i_number_of_authenticator_accounts", . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("i_number_of_authenticator_accounts"),
      "s_callstack",                        . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("s_callstack"),
      "i_number_of_visible_accounts",       . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("i_number_of_visible_accounts"),
      "s_operating_system",                 . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("s_operating_system"),
      "s_os_version",                       . %>% extract2("_source") %>% extract2("objects") %>% extract2("device") %>% extract2("s_os_version")
    ),
    ncol=2,
    byrow = TRUE
  )
}