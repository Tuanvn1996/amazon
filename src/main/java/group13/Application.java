package group13;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

import group13.storge.StorageProperties;
import group13.storge.StorageService;

@SpringBootApplication
@EnableConfigurationProperties(StorageProperties.class)
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
	@Bean
	CommandLineRunner init(final StorageService storageService)
	{
	    return new CommandLineRunner()
	    {
	        @Override
	        public void run(String... args) throws Exception
	        {
	            storageService.deleteAll();
	            storageService.init();              
	        }
	    };
	}
	
	/*CommandLineRunner init(StorageService storageService) {
		return (args) -> {
            storageService.deleteAll();
            storageService.init();
		};
	}*/
}
