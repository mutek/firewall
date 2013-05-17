= Firewall =

Un grezzo set di script per gestire alcuni eventi di log
Una volta clonato il repository si avvia l'esecuzione tramite lo script Avvia.sh
Questo script analizza alcune parti dei log del sistema e produce degli indirizzi IP che verranno filtrati dal firewall

In test alle regole di DROP dell'IP ci sono alcuni accorgimenti per rallentare degli eventi di rete ad parte dei singoli IP
Il concetto di base è solo quello di frenare un pochino per diminuire la probabilita di successo di un attacco combinatorio

Se eseguito ogni minuto cerca di contenere attacchi brute force sulle classiche porte di tipo automatico

L'impianto è mantenuto centralmente su un deposito Git che viene clonato da altri server autorizzati e li anche aggiornati quindi la blocklist si arricchisce in ogni server e viene condivisa

