# This file was automagically generated by mbed.org. For more information, 
# see http://mbed.org/handbook/Exporting-to-GCC-ARM-Embedded

###############################################################################
# Boiler-plate

# cross-platform directory manipulation
ifeq ($(shell echo $$OS),$$OS)
    MAKEDIR = if not exist "$(1)" mkdir "$(1)"
    RM = rmdir /S /Q "$(1)"
else
    MAKEDIR = '$(SHELL)' -c "mkdir -p \"$(1)\""
    RM = '$(SHELL)' -c "rm -rf \"$(1)\""
endif

OBJDIR := BUILD
# Move to the build directory
ifeq (,$(filter $(OBJDIR),$(notdir $(CURDIR))))
.SUFFIXES:
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
MAKETARGET = '$(MAKE)' --no-print-directory -C $(OBJDIR) -f '$(mkfile_path)' \
		'SRCDIR=$(CURDIR)' $(MAKECMDGOALS)
.PHONY: $(OBJDIR) clean
all:
	+@$(call MAKEDIR,$(OBJDIR))
	+@$(MAKETARGET)
$(OBJDIR): all
Makefile : ;
% :: $(OBJDIR) ; :
clean :
	$(call RM,$(OBJDIR))

else

# trick rules into thinking we are in the root, when we are in the bulid dir
VPATH = ..

# Boiler-plate
###############################################################################
# Project settings

PROJECT := prueba-rtx


# Project settings
###############################################################################
# Objects and Paths

OBJECTS += ./main.o
OBJECTS += ./planificadora.o
OBJECTS += ./listas.o
OBJECTS += ./traza.o
OBJECTS += ./trazaCiclos.o
OBJECTS += ./mbed-os/drivers/AnalogIn.o
OBJECTS += ./mbed-os/drivers/BusIn.o
OBJECTS += ./mbed-os/drivers/BusInOut.o
OBJECTS += ./mbed-os/drivers/BusOut.o
OBJECTS += ./mbed-os/drivers/CAN.o
OBJECTS += ./mbed-os/drivers/Ethernet.o
OBJECTS += ./mbed-os/drivers/FlashIAP.o
OBJECTS += ./mbed-os/drivers/I2C.o
OBJECTS += ./mbed-os/drivers/I2CSlave.o
OBJECTS += ./mbed-os/drivers/InterruptIn.o
OBJECTS += ./mbed-os/drivers/InterruptManager.o
OBJECTS += ./mbed-os/drivers/RawSerial.o
OBJECTS += ./mbed-os/drivers/SPI.o
OBJECTS += ./mbed-os/drivers/SPISlave.o
OBJECTS += ./mbed-os/drivers/Serial.o
OBJECTS += ./mbed-os/drivers/SerialBase.o
OBJECTS += ./mbed-os/drivers/Ticker.o
OBJECTS += ./mbed-os/drivers/Timeout.o
OBJECTS += ./mbed-os/drivers/Timer.o
OBJECTS += ./mbed-os/drivers/TimerEvent.o
OBJECTS += ./mbed-os/drivers/UARTSerial.o
OBJECTS += ./mbed-os/events/EventQueue.o
OBJECTS += ./mbed-os/events/equeue/equeue.o
OBJECTS += ./mbed-os/events/equeue/equeue_mbed.o
OBJECTS += ./mbed-os/events/equeue/equeue_posix.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/EthernetInterface.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/emac_lwip.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/emac_stack_lwip.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip-eth/arch/TARGET_NXP/lpc17_emac.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip-eth/arch/TARGET_NXP/lpc_phy_dp83848.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip-sys/arch/lwip_checksum.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip-sys/arch/lwip_memcpy.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip-sys/arch/lwip_sys_arch.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip-sys/lwip_random.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip-sys/lwip_tcp_isn.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/api/lwip_api_lib.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/api/lwip_api_msg.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/api/lwip_err.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/api/lwip_netbuf.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/api/lwip_netdb.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/api/lwip_netifapi.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/api/lwip_sockets.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/api/lwip_tcpip.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv4/lwip_autoip.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv4/lwip_dhcp.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv4/lwip_etharp.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv4/lwip_icmp.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv4/lwip_igmp.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv4/lwip_ip4.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv4/lwip_ip4_addr.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv4/lwip_ip4_frag.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv6/lwip_dhcp6.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv6/lwip_ethip6.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv6/lwip_icmp6.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv6/lwip_inet6.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv6/lwip_ip6.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv6/lwip_ip6_addr.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv6/lwip_ip6_frag.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv6/lwip_mld6.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv6/lwip_nd6.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_def.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_dns.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_inet_chksum.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_init.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_ip.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_mem.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_memp.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_netif.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_pbuf.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_raw.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_stats.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_sys.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_tcp.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_tcp_in.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_tcp_out.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_timeouts.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/lwip_udp.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/lwip_ethernet.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/lwip_ethernetif.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/lwip_lowpan6.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_auth.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_ccp.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_chap-md5.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_chap-new.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_chap_ms.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_demand.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_eap.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_ecp.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_eui64.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_fsm.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_ipcp.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_ipv6cp.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_lcp.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_magic.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_mppe.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_multilink.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_ppp.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_pppapi.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_pppcrypt.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_pppoe.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_pppol2tp.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_pppos.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_upap.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_utils.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/lwip_vj.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/polarssl/lwip_arc4.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/polarssl/lwip_des.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/polarssl/lwip_md4.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/polarssl/lwip_md5.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/polarssl/lwip_sha1.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/lwip_stack.o
OBJECTS += ./mbed-os/features/FEATURE_LWIP/lwip-interface/ppp_lwip.o
OBJECTS += ./mbed-os/features/filesystem/Dir.o
OBJECTS += ./mbed-os/features/filesystem/File.o
OBJECTS += ./mbed-os/features/filesystem/FileSystem.o
OBJECTS += ./mbed-os/features/filesystem/bd/ChainingBlockDevice.o
OBJECTS += ./mbed-os/features/filesystem/bd/HeapBlockDevice.o
OBJECTS += ./mbed-os/features/filesystem/bd/MBRBlockDevice.o
OBJECTS += ./mbed-os/features/filesystem/bd/ProfilingBlockDevice.o
OBJECTS += ./mbed-os/features/filesystem/bd/SlicingBlockDevice.o
OBJECTS += ./mbed-os/features/filesystem/fat/ChaN/ccsbcs.o
OBJECTS += ./mbed-os/features/filesystem/fat/ChaN/ff.o
OBJECTS += ./mbed-os/features/filesystem/fat/FATFileSystem.o
OBJECTS += ./mbed-os/features/frameworks/greentea-client/source/greentea_metrics.o
OBJECTS += ./mbed-os/features/frameworks/greentea-client/source/greentea_serial.o
OBJECTS += ./mbed-os/features/frameworks/greentea-client/source/greentea_test_env.o
OBJECTS += ./mbed-os/features/frameworks/unity/source/unity.o
OBJECTS += ./mbed-os/features/frameworks/utest/mbed-utest-shim.o
OBJECTS += ./mbed-os/features/frameworks/utest/source/unity_handler.o
OBJECTS += ./mbed-os/features/frameworks/utest/source/utest_case.o
OBJECTS += ./mbed-os/features/frameworks/utest/source/utest_default_handlers.o
OBJECTS += ./mbed-os/features/frameworks/utest/source/utest_greentea_handlers.o
OBJECTS += ./mbed-os/features/frameworks/utest/source/utest_harness.o
OBJECTS += ./mbed-os/features/frameworks/utest/source/utest_shim.o
OBJECTS += ./mbed-os/features/frameworks/utest/source/utest_stack_trace.o
OBJECTS += ./mbed-os/features/frameworks/utest/source/utest_types.o
OBJECTS += ./mbed-os/features/mbedtls/platform/src/mbed_trng.o
OBJECTS += ./mbed-os/features/mbedtls/src/aes.o
OBJECTS += ./mbed-os/features/mbedtls/src/aesni.o
OBJECTS += ./mbed-os/features/mbedtls/src/arc4.o
OBJECTS += ./mbed-os/features/mbedtls/src/asn1parse.o
OBJECTS += ./mbed-os/features/mbedtls/src/asn1write.o
OBJECTS += ./mbed-os/features/mbedtls/src/base64.o
OBJECTS += ./mbed-os/features/mbedtls/src/bignum.o
OBJECTS += ./mbed-os/features/mbedtls/src/blowfish.o
OBJECTS += ./mbed-os/features/mbedtls/src/camellia.o
OBJECTS += ./mbed-os/features/mbedtls/src/ccm.o
OBJECTS += ./mbed-os/features/mbedtls/src/certs.o
OBJECTS += ./mbed-os/features/mbedtls/src/cipher.o
OBJECTS += ./mbed-os/features/mbedtls/src/cipher_wrap.o
OBJECTS += ./mbed-os/features/mbedtls/src/cmac.o
OBJECTS += ./mbed-os/features/mbedtls/src/ctr_drbg.o
OBJECTS += ./mbed-os/features/mbedtls/src/debug.o
OBJECTS += ./mbed-os/features/mbedtls/src/des.o
OBJECTS += ./mbed-os/features/mbedtls/src/dhm.o
OBJECTS += ./mbed-os/features/mbedtls/src/ecdh.o
OBJECTS += ./mbed-os/features/mbedtls/src/ecdsa.o
OBJECTS += ./mbed-os/features/mbedtls/src/ecjpake.o
OBJECTS += ./mbed-os/features/mbedtls/src/ecp.o
OBJECTS += ./mbed-os/features/mbedtls/src/ecp_curves.o
OBJECTS += ./mbed-os/features/mbedtls/src/entropy.o
OBJECTS += ./mbed-os/features/mbedtls/src/entropy_poll.o
OBJECTS += ./mbed-os/features/mbedtls/src/error.o
OBJECTS += ./mbed-os/features/mbedtls/src/gcm.o
OBJECTS += ./mbed-os/features/mbedtls/src/havege.o
OBJECTS += ./mbed-os/features/mbedtls/src/hmac_drbg.o
OBJECTS += ./mbed-os/features/mbedtls/src/md.o
OBJECTS += ./mbed-os/features/mbedtls/src/md2.o
OBJECTS += ./mbed-os/features/mbedtls/src/md4.o
OBJECTS += ./mbed-os/features/mbedtls/src/md5.o
OBJECTS += ./mbed-os/features/mbedtls/src/md_wrap.o
OBJECTS += ./mbed-os/features/mbedtls/src/memory_buffer_alloc.o
OBJECTS += ./mbed-os/features/mbedtls/src/net_sockets.o
OBJECTS += ./mbed-os/features/mbedtls/src/oid.o
OBJECTS += ./mbed-os/features/mbedtls/src/padlock.o
OBJECTS += ./mbed-os/features/mbedtls/src/pem.o
OBJECTS += ./mbed-os/features/mbedtls/src/pk.o
OBJECTS += ./mbed-os/features/mbedtls/src/pk_wrap.o
OBJECTS += ./mbed-os/features/mbedtls/src/pkcs11.o
OBJECTS += ./mbed-os/features/mbedtls/src/pkcs12.o
OBJECTS += ./mbed-os/features/mbedtls/src/pkcs5.o
OBJECTS += ./mbed-os/features/mbedtls/src/pkparse.o
OBJECTS += ./mbed-os/features/mbedtls/src/pkwrite.o
OBJECTS += ./mbed-os/features/mbedtls/src/platform.o
OBJECTS += ./mbed-os/features/mbedtls/src/ripemd160.o
OBJECTS += ./mbed-os/features/mbedtls/src/rsa.o
OBJECTS += ./mbed-os/features/mbedtls/src/sha1.o
OBJECTS += ./mbed-os/features/mbedtls/src/sha256.o
OBJECTS += ./mbed-os/features/mbedtls/src/sha512.o
OBJECTS += ./mbed-os/features/mbedtls/src/ssl_cache.o
OBJECTS += ./mbed-os/features/mbedtls/src/ssl_ciphersuites.o
OBJECTS += ./mbed-os/features/mbedtls/src/ssl_cli.o
OBJECTS += ./mbed-os/features/mbedtls/src/ssl_cookie.o
OBJECTS += ./mbed-os/features/mbedtls/src/ssl_srv.o
OBJECTS += ./mbed-os/features/mbedtls/src/ssl_ticket.o
OBJECTS += ./mbed-os/features/mbedtls/src/ssl_tls.o
OBJECTS += ./mbed-os/features/mbedtls/src/threading.o
OBJECTS += ./mbed-os/features/mbedtls/src/timing.o
OBJECTS += ./mbed-os/features/mbedtls/src/version.o
OBJECTS += ./mbed-os/features/mbedtls/src/version_features.o
OBJECTS += ./mbed-os/features/mbedtls/src/x509.o
OBJECTS += ./mbed-os/features/mbedtls/src/x509_create.o
OBJECTS += ./mbed-os/features/mbedtls/src/x509_crl.o
OBJECTS += ./mbed-os/features/mbedtls/src/x509_crt.o
OBJECTS += ./mbed-os/features/mbedtls/src/x509_csr.o
OBJECTS += ./mbed-os/features/mbedtls/src/x509write_crt.o
OBJECTS += ./mbed-os/features/mbedtls/src/x509write_csr.o
OBJECTS += ./mbed-os/features/mbedtls/src/xtea.o
OBJECTS += ./mbed-os/features/netsocket/NetworkInterface.o
OBJECTS += ./mbed-os/features/netsocket/NetworkStack.o
OBJECTS += ./mbed-os/features/netsocket/Socket.o
OBJECTS += ./mbed-os/features/netsocket/SocketAddress.o
OBJECTS += ./mbed-os/features/netsocket/TCPServer.o
OBJECTS += ./mbed-os/features/netsocket/TCPSocket.o
OBJECTS += ./mbed-os/features/netsocket/UDPSocket.o
OBJECTS += ./mbed-os/features/netsocket/WiFiAccessPoint.o
OBJECTS += ./mbed-os/features/netsocket/cellular/generic_modem_driver/OnboardCellularInterface.o
OBJECTS += ./mbed-os/features/netsocket/cellular/generic_modem_driver/PPPCellularInterface.o
OBJECTS += ./mbed-os/features/netsocket/cellular/generic_modem_driver/UARTCellularInterface.o
OBJECTS += ./mbed-os/features/netsocket/nsapi_dns.o
OBJECTS += ./mbed-os/hal/mbed_flash_api.o
OBJECTS += ./mbed-os/hal/mbed_gpio.o
OBJECTS += ./mbed-os/hal/mbed_lp_ticker_api.o
OBJECTS += ./mbed-os/hal/mbed_pinmap_common.o
OBJECTS += ./mbed-os/hal/mbed_ticker_api.o
OBJECTS += ./mbed-os/hal/mbed_us_ticker_api.o
OBJECTS += ./mbed-os/platform/ATCmdParser.o
OBJECTS += ./mbed-os/platform/CallChain.o
OBJECTS += ./mbed-os/platform/FileBase.o
OBJECTS += ./mbed-os/platform/FileHandle.o
OBJECTS += ./mbed-os/platform/FilePath.o
OBJECTS += ./mbed-os/platform/FileSystemHandle.o
OBJECTS += ./mbed-os/platform/LocalFileSystem.o
OBJECTS += ./mbed-os/platform/Stream.o
OBJECTS += ./mbed-os/platform/mbed_alloc_wrappers.o
OBJECTS += ./mbed-os/platform/mbed_application.o
OBJECTS += ./mbed-os/platform/mbed_assert.o
OBJECTS += ./mbed-os/platform/mbed_board.o
OBJECTS += ./mbed-os/platform/mbed_critical.o
OBJECTS += ./mbed-os/platform/mbed_error.o
OBJECTS += ./mbed-os/platform/mbed_interface.o
OBJECTS += ./mbed-os/platform/mbed_mem_trace.o
OBJECTS += ./mbed-os/platform/mbed_mktime.o
OBJECTS += ./mbed-os/platform/mbed_poll.o
OBJECTS += ./mbed-os/platform/mbed_retarget.o
OBJECTS += ./mbed-os/platform/mbed_rtc_time.o
OBJECTS += ./mbed-os/platform/mbed_sdk_boot.o
OBJECTS += ./mbed-os/platform/mbed_semihost_api.o
OBJECTS += ./mbed-os/platform/mbed_stats.o
OBJECTS += ./mbed-os/platform/mbed_wait_api_no_rtos.o
OBJECTS += ./mbed-os/platform/mbed_wait_api_rtos.o
OBJECTS += ./mbed-os/rtos/Mutex.o
OBJECTS += ./mbed-os/rtos/RtosTimer.o
OBJECTS += ./mbed-os/rtos/Semaphore.o
OBJECTS += ./mbed-os/rtos/Thread.o
OBJECTS += ./mbed-os/rtos/mbed_boot.o
OBJECTS += ./mbed-os/rtos/rtos_idle.o
OBJECTS += ./mbed-os/rtos/rtx4/cmsis_os1.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/RTX_Config.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/TARGET_M3/TOOLCHAIN_GCC/irq_cm3.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/rt_OsEventObserver.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/rtx_delay.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/rtx_evflags.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/rtx_evr.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/rtx_kernel.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/rtx_lib.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/rtx_memory.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/rtx_mempool.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/rtx_msgqueue.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/rtx_mutex.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/rtx_semaphore.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/rtx_system.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/rtx_thread.o
OBJECTS += ./mbed-os/rtos/rtx5/TARGET_CORTEX_M/rtx_timer.o
OBJECTS += ./mbed-os/rtos/rtx5/mbed_rtx_handlers.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/analogin_api.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/analogout_api.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/can_api.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/device/TOOLCHAIN_GCC_ARM/startup_LPC17xx.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/device/flash_api.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/device/system_LPC17xx.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/ethernet_api.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/gpio_api.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/gpio_irq_api.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/i2c_api.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/pinmap.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/port_api.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/pwmout_api.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/rtc_api.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/serial_api.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/sleep.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/spi_api.o
OBJECTS += ./mbed-os/targets/TARGET_NXP/TARGET_LPC176X/us_ticker.o


INCLUDE_PATHS += -I../
INCLUDE_PATHS += -I../.
INCLUDE_PATHS += -I.././mbed-os
INCLUDE_PATHS += -I.././mbed-os/cmsis
INCLUDE_PATHS += -I.././mbed-os/cmsis/TARGET_CORTEX_M
INCLUDE_PATHS += -I.././mbed-os/cmsis/TARGET_CORTEX_M/TOOLCHAIN_GCC
INCLUDE_PATHS += -I.././mbed-os/cmsis/TOOLCHAIN_GCC
INCLUDE_PATHS += -I.././mbed-os/drivers
INCLUDE_PATHS += -I.././mbed-os/events
INCLUDE_PATHS += -I.././mbed-os/events/equeue
INCLUDE_PATHS += -I.././mbed-os/features
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip-eth
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip-eth/arch
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip-eth/arch/TARGET_NXP
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip-sys
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip-sys/arch
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/api
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv4
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/core/ipv6
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/include
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/include/lwip
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/include/lwip/priv
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/include/lwip/prot
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/include/netif
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/include/netif/ppp
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/include/netif/ppp/polarssl
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp
INCLUDE_PATHS += -I.././mbed-os/features/FEATURE_LWIP/lwip-interface/lwip/src/netif/ppp/polarssl
INCLUDE_PATHS += -I.././mbed-os/features/filesystem
INCLUDE_PATHS += -I.././mbed-os/features/filesystem/bd
INCLUDE_PATHS += -I.././mbed-os/features/filesystem/fat
INCLUDE_PATHS += -I.././mbed-os/features/filesystem/fat/ChaN
INCLUDE_PATHS += -I.././mbed-os/features/frameworks
INCLUDE_PATHS += -I.././mbed-os/features/frameworks/greentea-client
INCLUDE_PATHS += -I.././mbed-os/features/frameworks/greentea-client/greentea-client
INCLUDE_PATHS += -I.././mbed-os/features/frameworks/greentea-client/source
INCLUDE_PATHS += -I.././mbed-os/features/frameworks/unity
INCLUDE_PATHS += -I.././mbed-os/features/frameworks/unity/source
INCLUDE_PATHS += -I.././mbed-os/features/frameworks/unity/unity
INCLUDE_PATHS += -I.././mbed-os/features/frameworks/utest
INCLUDE_PATHS += -I.././mbed-os/features/frameworks/utest/source
INCLUDE_PATHS += -I.././mbed-os/features/frameworks/utest/utest
INCLUDE_PATHS += -I.././mbed-os/features/mbedtls
INCLUDE_PATHS += -I.././mbed-os/features/mbedtls/importer
INCLUDE_PATHS += -I.././mbed-os/features/mbedtls/inc
INCLUDE_PATHS += -I.././mbed-os/features/mbedtls/inc/mbedtls
INCLUDE_PATHS += -I.././mbed-os/features/mbedtls/platform
INCLUDE_PATHS += -I.././mbed-os/features/mbedtls/platform/inc
INCLUDE_PATHS += -I.././mbed-os/features/mbedtls/platform/src
INCLUDE_PATHS += -I.././mbed-os/features/mbedtls/src
INCLUDE_PATHS += -I.././mbed-os/features/mbedtls/targets
INCLUDE_PATHS += -I.././mbed-os/features/nanostack
INCLUDE_PATHS += -I.././mbed-os/features/netsocket
INCLUDE_PATHS += -I.././mbed-os/features/netsocket/cellular
INCLUDE_PATHS += -I.././mbed-os/features/netsocket/cellular/generic_modem_driver
INCLUDE_PATHS += -I.././mbed-os/features/netsocket/cellular/utils
INCLUDE_PATHS += -I.././mbed-os/features/storage
INCLUDE_PATHS += -I.././mbed-os/hal
INCLUDE_PATHS += -I.././mbed-os/hal/storage_abstraction
INCLUDE_PATHS += -I.././mbed-os/platform
INCLUDE_PATHS += -I.././mbed-os/rtos
INCLUDE_PATHS += -I.././mbed-os/rtos/rtx4
INCLUDE_PATHS += -I.././mbed-os/rtos/rtx5
INCLUDE_PATHS += -I.././mbed-os/rtos/rtx5/TARGET_CORTEX_M
INCLUDE_PATHS += -I.././mbed-os/rtos/rtx5/TARGET_CORTEX_M/TARGET_M3
INCLUDE_PATHS += -I.././mbed-os/rtos/rtx5/TARGET_CORTEX_M/TARGET_M3/TOOLCHAIN_GCC
INCLUDE_PATHS += -I.././mbed-os/targets
INCLUDE_PATHS += -I.././mbed-os/targets/TARGET_NXP
INCLUDE_PATHS += -I.././mbed-os/targets/TARGET_NXP/TARGET_LPC176X
INCLUDE_PATHS += -I.././mbed-os/targets/TARGET_NXP/TARGET_LPC176X/TARGET_MBED_LPC1768
INCLUDE_PATHS += -I.././mbed-os/targets/TARGET_NXP/TARGET_LPC176X/device
INCLUDE_PATHS += -I.././mbed-os/targets/TARGET_NXP/TARGET_LPC176X/device/TOOLCHAIN_GCC_ARM

LIBRARY_PATHS :=
LIBRARIES :=
LINKER_SCRIPT ?= .././mbed-os/targets/TARGET_NXP/TARGET_LPC176X/device/TOOLCHAIN_GCC_ARM/LPC1768.ld

# Objects and Paths
###############################################################################
# Tools and Flags

AS      = 'arm-none-eabi-gcc' '-x' 'assembler-with-cpp' '-c' '-Wall' '-Wextra' '-Wno-unused-parameter' '-Wno-missing-field-initializers' '-fmessage-length=0' '-fno-exceptions' '-fno-builtin' '-ffunction-sections' '-fdata-sections' '-funsigned-char' '-MMD' '-fno-delete-null-pointer-checks' '-fomit-frame-pointer' '-O0' '-g3' '-DMBED_DEBUG' '-DMBED_TRAP_ERRORS_ENABLED=1' '-mcpu=cortex-m3' '-mthumb'
CC      = 'arm-none-eabi-gcc' '-std=gnu99' '-c' '-Wall' '-Wextra' '-Wno-unused-parameter' '-Wno-missing-field-initializers' '-fmessage-length=0' '-fno-exceptions' '-fno-builtin' '-ffunction-sections' '-fdata-sections' '-funsigned-char' '-MMD' '-fno-delete-null-pointer-checks' '-fomit-frame-pointer' '-O0' '-g3' '-DMBED_DEBUG' '-DMBED_TRAP_ERRORS_ENABLED=1' '-mcpu=cortex-m3' '-mthumb'
CPP     = 'arm-none-eabi-g++' '-std=gnu++98' '-fno-rtti' '-Wvla' '-c' '-Wall' '-Wextra' '-Wno-unused-parameter' '-Wno-missing-field-initializers' '-fmessage-length=0' '-fno-exceptions' '-fno-builtin' '-ffunction-sections' '-fdata-sections' '-funsigned-char' '-MMD' '-fno-delete-null-pointer-checks' '-fomit-frame-pointer' '-O0' '-g3' '-DMBED_DEBUG' '-DMBED_TRAP_ERRORS_ENABLED=1' '-mcpu=cortex-m3' '-mthumb'
LD      = 'arm-none-eabi-gcc'
ELF2BIN = 'arm-none-eabi-objcopy'
PREPROC = 'arm-none-eabi-cpp' '-E' '-P' '-Wl,--gc-sections' '-Wl,--wrap,main' '-Wl,--wrap,_malloc_r' '-Wl,--wrap,_free_r' '-Wl,--wrap,_realloc_r' '-Wl,--wrap,_memalign_r' '-Wl,--wrap,_calloc_r' '-Wl,--wrap,exit' '-Wl,--wrap,atexit' '-Wl,-n' '-mcpu=cortex-m3' '-mthumb'


C_FLAGS += -std=gnu99
C_FLAGS += -DDEVICE_ERROR_PATTERN=1
C_FLAGS += -DFEATURE_LWIP=1
C_FLAGS += -D__MBED__=1
C_FLAGS += -DDEVICE_I2CSLAVE=1
C_FLAGS += -DTARGET_LIKE_MBED
C_FLAGS += -DTARGET_NXP
C_FLAGS += -DTARGET_LPC176X
C_FLAGS += -D__MBED_CMSIS_RTOS_CM
C_FLAGS += -DDEVICE_RTC=1
C_FLAGS += -DTOOLCHAIN_object
C_FLAGS += -D__CMSIS_RTOS
C_FLAGS += -DDEVICE_DEBUG_AWARENESS=1
C_FLAGS += -DTOOLCHAIN_GCC
C_FLAGS += -DDEVICE_CAN=1
C_FLAGS += -DTARGET_LIKE_CORTEX_M3
C_FLAGS += -DTARGET_CORTEX_M
C_FLAGS += -DTARGET_DEBUG
C_FLAGS += -DARM_MATH_CM3
C_FLAGS += -DDEVICE_ANALOGOUT=1
C_FLAGS += -DTARGET_UVISOR_UNSUPPORTED
C_FLAGS += -DTARGET_M3
C_FLAGS += -DDEVICE_PWMOUT=1
C_FLAGS += -DDEVICE_INTERRUPTIN=1
C_FLAGS += -DTARGET_LPCTarget
C_FLAGS += -DDEVICE_I2C=1
C_FLAGS += -DDEVICE_PORTOUT=1
C_FLAGS += -D__CORTEX_M3
C_FLAGS += -DDEVICE_STDIO_MESSAGES=1
C_FLAGS += -DTARGET_LPC1768
C_FLAGS += -DDEVICE_PORTINOUT=1
C_FLAGS += -DDEVICE_SERIAL_FC=1
C_FLAGS += -DTARGET_MBED_LPC1768
C_FLAGS += -DDEVICE_PORTIN=1
C_FLAGS += -DDEVICE_SLEEP=1
C_FLAGS += -DTOOLCHAIN_GCC_ARM
C_FLAGS += -DDEVICE_SPI=1
C_FLAGS += -DDEVICE_ETHERNET=1
C_FLAGS += -DDEVICE_SPISLAVE=1
C_FLAGS += -DDEVICE_ANALOGIN=1
C_FLAGS += -DDEVICE_SERIAL=1
C_FLAGS += -DDEVICE_SEMIHOST=1
C_FLAGS += -DMBED_BUILD_TIMESTAMP=1507687221.52
C_FLAGS += -DDEVICE_LOCALFILESYSTEM=1
C_FLAGS += -include
C_FLAGS += mbed_config.h

CXX_FLAGS += -std=gnu++98
CXX_FLAGS += -fno-rtti
CXX_FLAGS += -Wvla
CXX_FLAGS += -DDEVICE_ERROR_PATTERN=1
CXX_FLAGS += -DFEATURE_LWIP=1
CXX_FLAGS += -D__MBED__=1
CXX_FLAGS += -DDEVICE_I2CSLAVE=1
CXX_FLAGS += -DTARGET_LIKE_MBED
CXX_FLAGS += -DTARGET_NXP
CXX_FLAGS += -DTARGET_LPC176X
CXX_FLAGS += -D__MBED_CMSIS_RTOS_CM
CXX_FLAGS += -DDEVICE_RTC=1
CXX_FLAGS += -DTOOLCHAIN_object
CXX_FLAGS += -D__CMSIS_RTOS
CXX_FLAGS += -DDEVICE_DEBUG_AWARENESS=1
CXX_FLAGS += -DTOOLCHAIN_GCC
CXX_FLAGS += -DDEVICE_CAN=1
CXX_FLAGS += -DTARGET_LIKE_CORTEX_M3
CXX_FLAGS += -DTARGET_CORTEX_M
CXX_FLAGS += -DTARGET_DEBUG
CXX_FLAGS += -DARM_MATH_CM3
CXX_FLAGS += -DDEVICE_ANALOGOUT=1
CXX_FLAGS += -DTARGET_UVISOR_UNSUPPORTED
CXX_FLAGS += -DTARGET_M3
CXX_FLAGS += -DDEVICE_PWMOUT=1
CXX_FLAGS += -DDEVICE_INTERRUPTIN=1
CXX_FLAGS += -DTARGET_LPCTarget
CXX_FLAGS += -DDEVICE_I2C=1
CXX_FLAGS += -DDEVICE_PORTOUT=1
CXX_FLAGS += -D__CORTEX_M3
CXX_FLAGS += -DDEVICE_STDIO_MESSAGES=1
CXX_FLAGS += -DTARGET_LPC1768
CXX_FLAGS += -DDEVICE_PORTINOUT=1
CXX_FLAGS += -DDEVICE_SERIAL_FC=1
CXX_FLAGS += -DTARGET_MBED_LPC1768
CXX_FLAGS += -DDEVICE_PORTIN=1
CXX_FLAGS += -DDEVICE_SLEEP=1
CXX_FLAGS += -DTOOLCHAIN_GCC_ARM
CXX_FLAGS += -DDEVICE_SPI=1
CXX_FLAGS += -DDEVICE_ETHERNET=1
CXX_FLAGS += -DDEVICE_SPISLAVE=1
CXX_FLAGS += -DDEVICE_ANALOGIN=1
CXX_FLAGS += -DDEVICE_SERIAL=1
CXX_FLAGS += -DDEVICE_SEMIHOST=1
CXX_FLAGS += -DMBED_BUILD_TIMESTAMP=1507687221.52
CXX_FLAGS += -DDEVICE_LOCALFILESYSTEM=1
CXX_FLAGS += -include
CXX_FLAGS += mbed_config.h

ASM_FLAGS += -x
ASM_FLAGS += assembler-with-cpp
ASM_FLAGS += -D__CMSIS_RTOS
ASM_FLAGS += -D__MBED_CMSIS_RTOS_CM
ASM_FLAGS += -D__CORTEX_M3
ASM_FLAGS += -DARM_MATH_CM3


LD_FLAGS :=-Wl,--gc-sections -Wl,--wrap,main -Wl,--wrap,_malloc_r -Wl,--wrap,_free_r -Wl,--wrap,_realloc_r -Wl,--wrap,_memalign_r -Wl,--wrap,_calloc_r -Wl,--wrap,exit -Wl,--wrap,atexit -Wl,-n -mcpu=cortex-m3 -mthumb 
LD_SYS_LIBS :=-Wl,--start-group -lstdc++ -lsupc++ -lm -lc -lgcc -lnosys  -Wl,--end-group

# Tools and Flags
###############################################################################
# Rules

.PHONY: all lst size


all: $(PROJECT).bin $(PROJECT).hex size


.asm.o:
	+@$(call MAKEDIR,$(dir $@))
	+@echo "Assemble: $(notdir $<)"
	@$(AS) -c $(ASM_FLAGS) $(INCLUDE_PATHS) -o $@ $<

.s.o:
	+@$(call MAKEDIR,$(dir $@))
	+@echo "Assemble: $(notdir $<)"
	@$(AS) -c $(ASM_FLAGS) $(INCLUDE_PATHS) -o $@ $<

.S.o:
	+@$(call MAKEDIR,$(dir $@))
	+@echo "Assemble: $(notdir $<)"
	@$(AS) -c $(ASM_FLAGS) $(INCLUDE_PATHS) -o $@ $<

.c.o:
	+@$(call MAKEDIR,$(dir $@))
	+@echo "Compile: $(notdir $<)"
	@$(CC) $(C_FLAGS) $(INCLUDE_PATHS) -o $@ $<

.cpp.o:
	+@$(call MAKEDIR,$(dir $@))
	+@echo "Compile: $(notdir $<)"
	@$(CPP) $(CXX_FLAGS) $(INCLUDE_PATHS) -o $@ $<


$(PROJECT).link_script.ld: $(LINKER_SCRIPT)
	@$(PREPROC) $< -o $@



$(PROJECT).elf: $(OBJECTS) $(SYS_OBJECTS) $(PROJECT).link_script.ld 
	+@echo "link: $(notdir $@)"
	@$(LD) $(LD_FLAGS) -T $(filter %.ld, $^) $(LIBRARY_PATHS) --output $@ $(filter %.o, $^) $(LIBRARIES) $(LD_SYS_LIBS)


$(PROJECT).bin: $(PROJECT).elf
	$(ELF2BIN) -O binary $< $@
	+@echo "===== bin file ready to flash: $(OBJDIR)/$@ =====" 

$(PROJECT).hex: $(PROJECT).elf
	$(ELF2BIN) -O ihex $< $@


# Rules
###############################################################################
# Dependencies

DEPS = $(OBJECTS:.o=.d) $(SYS_OBJECTS:.o=.d)
-include $(DEPS)
endif

# Dependencies
###############################################################################
