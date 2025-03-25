package com.ewem.web.core.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;


@Configuration
@ConfigurationProperties(prefix = "fabric")
@Data
public class HyperLedgerFabricProperties {

    String mspId;

    String networkConnectionConfigPath;

    String certificatePath;

    String privateKeyPath;

    String tlsCertPath;

    String channel;
}
