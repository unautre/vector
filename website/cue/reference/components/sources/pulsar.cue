package metadata

components: sources: pulsar: {
	title: "Apache Pulsar"

	classes: {
		commonly_used: false
		delivery:      "at_least_once"
		development:   "beta"
		egress_method: "stream"
		service_providers: []
		stateful: false
	}

	features: {}

	support: {
		requirements: []
		warnings: []
		notices: []
	}

	configuration: {
		auth: {
			common:      false
			description: "Options for the authentication strategy."
			required:    false
			type: object: {
				examples: []
				options: {
					name: {
						common:      false
						description: "The basic authentication name."
						required:    false
						type: string: {
							default: null
							examples: ["${PULSAR_NAME}", "name123"]
						}
					}
					token: {
						common:      false
						description: "The basic authentication password."
						required:    false
						type: string: {
							default: null
							examples: ["${PULSAR_TOKEN}", "123456789"]
						}
					}
					oauth2: {
						common:      false
						description: "Options for OAuth2 authentication."
						required:    false
						type: object: {
							examples: []
							options: {
								issuer_url: {
									description: "The issuer url."
									required:    true
									type: string: {
										examples: ["${OAUTH2_ISSUER_URL}", "https://oauth2.issuer"]
									}
								}
								credentials_url: {
									description: "The url for credentials. The data url is also supported."
									required:    true
									type: string: {
										examples: ["{OAUTH2_CREDENTIALS_URL}", "file:///oauth2_credentials", "data:application/json;base64,cHVsc2FyCg=="]
									}
								}
								audience: {
									common:      false
									description: "OAuth2 audience."
									required:    false
									type: string: {
										default: null
										examples: ["${OAUTH2_AUDIENCE}", "pulsar"]
									}
								}
								scope: {
									common:      false
									description: "OAuth2 scope."
									required:    false
									type: string: {
										default: null
										examples: ["${OAUTH2_SCOPE}", "admin"]
									}
								}
							}
						}
					}
				}
			}
		}
		endpoint: {
			description: "Endpoint to which the pulsar client should connect to."
			required:    true
			type: string: {
				examples: ["pulsar://127.0.0.1:6650"]
			}
		}
		topics: {
			description: "The Pulsar topic names to read events from."
			required:    true
			type: string: {
				examples: ["topic-1234"]
			}
		}
	}

	input: {
		logs:    true
		metrics: null
		traces:  false
	}

	telemetry: metrics: {
		component_discarded_events_total: components.sources.internal_metrics.output.metrics.component_discarded_events_total
		component_errors_total:           components.sources.internal_metrics.output.metrics.component_errors_total
		encode_errors_total:              components.sources.internal_metrics.output.metrics.encode_errors_total
	}
}