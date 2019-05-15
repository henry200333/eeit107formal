package org.iii.seaotter.artist;

import org.springframework.beans.factory.annotation.Autowired;

public class PerformanceService {

	@Autowired
	ArtistService artistService;
	@Autowired
	PerformanceDao performanceDao;

	public void inputVideo(String artistName, String performanceName, String url) {
		Artist artist = null;
		artist = artistService.login(artistName);

		if (performanceName != null && performanceName.length() != 0) {
			if (url != null && url.length() != 0) {
				Performance performance = new Performance();
				performance.setaId(artist.getId());
				performance.setpName(performanceName);
				performance.setpUrl(url);
				performance.setCounts(0);
				performanceDao.insert(performance);
			}
		}
	}
}
