# Ambiente di laboratorio – rilevamento del movimento laterale

Ambiente Docker realizzato per il tirocinio della laurea triennale: simula una rete con un attaccante
(Metasploit) e raccoglie la telemetria (rete, processi, log) in OpenSearch per studiare il movimento laterale.

> **Stato:** archivio del progetto così com'era (2022–2023). Contiene solo l'infrastruttura di raccolta dati;
> la logica di rilevamento (regole, query, analisi) non è presente in questo repository e la configurazione
> richiede alcune correzioni prima di avviarsi.

## Componenti

| Ruolo | Servizi |
|---|---|
| Attaccante | Metasploit + Postgres (`ms`, `db`, `runMSF.sh`) |
| Raccolta | Packetbeat (rete), Auditbeat (processi/socket/file), Filebeat (log) |
| Trasporto | Logstash, Kafka + Zookeeper, Mosquitto (MQTT) |
| Storage / visualizzazione | OpenSearch (2 nodi), OpenSearch Dashboards |
| Utility | `network-multitool` |

Rete Docker `env-net` su `10.0.0.0/24` con IP statici.

## File

- `docker-compose.yml` – stack principale
- `docker-compose.yml.bkp` – versione precedente con stack ELK
- `elk.yml`, `opensearch.yml`, `packetbeat-docker-compose.yml` – compose alternativi/parziali
- `packetbeat/`, `auditbeat/`, `filebeat/`, `logstash/`, `mosquitto/` – configurazioni
- `extensions/` – estensioni dello stack ELK (docker-elk)

## Checklist originale

- [ ] Metasploit
- [x] Filebeat
- [ ] Auditbeat
- [x] OpenSearch
- [x] Logstash
- [x] OpenSearch Dashboards
- [x] Kafka
- [x] Mosquitto

## Problemi noti

- `configs: pb_config` usato da `packetbeat` ma non definito in `docker-compose.yml`
- Volume di Filebeat con percorso segnaposto (`/path/to/filebeat.yml`)
- Packetbeat e Filebeat configurano più output contemporaneamente (Beats ne ammette uno)
- `mosquitto.conf` usa sé stesso come `password_file`
- `elk.yml` fa riferimento a cartelle (`setup/`, `elasticsearch/`, `kibana/`) non incluse
- Credenziali di default (`admin`/`changeme`): solo per uso in laboratorio
