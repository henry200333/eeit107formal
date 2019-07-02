package org.iii.seaotter.jayee.service;

import java.net.URL;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.iii.seaotter.jayee.dao.ArtistDao;
import org.iii.seaotter.jayee.entity.Artist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import net.bytebuddy.asm.Advice.This;

@Service
@Transactional
public class ArtistService {
	@Autowired
	private ArtistDao artistDao;

	@Transactional(readOnly = true)
	public List<Artist> getAll() {
		return artistDao.findAll();
	}

	@Transactional(readOnly = true)
	public List<Artist> getNameByFanNumberTop5() {
		return artistDao.findTop5ByOrderByFanNumberDesc();
	}

	public Artist getById(Long id) {
		return artistDao.findById(id).orElse(null);
	}

	public Artist insert(Artist entity) {
		return artistDao.save(entity);
	}

	public Artist update(Artist entity) {
		Artist artist = null;
		if (artistDao.findById(entity.getId()) != null) {
			artist = artistDao.save(entity);
		}
		return artist;
	}

	public void delete(Artist entity) {
		if (artistDao.findById(entity.getId()) != null)
			artistDao.delete(entity);
	}

	public static void saveImage(MultipartFile imageFile) throws Exception {
		URL R = This.class.getResource("/");
		String decoded = URLDecoder.decode(R.getFile(), "UTF-8");
		if (decoded.startsWith("/")) {
			decoded = decoded.replaceFirst("/", "");
		}
		decoded = decoded.replace("target", "src");
		decoded = decoded.replace("classes", "main");
		decoded += "/webapp/resources/user-image/";
		Path path = Paths.get(decoded + imageFile.getOriginalFilename());
		Files.write(path, imageFile.getBytes());
	}

}
