package com.kallil;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.iii.seaotter.artist.Artist;
import org.iii.seaotter.artist.ArtistDao;
import org.iii.seaotter.artist.Performance;

public class CountryDAO {

	String URL = "jdbc:sqlserver://localhost:1433;databaseName=SeaOtter";

	private static String INSERT = "insert into Country values(?,?,?,?,?)";

	public void insert(CountryBean CountryBean) {
		try (Connection conn = DriverManager.getConnection(URL, "sa", "passw0rd");) {
			PreparedStatement pstmt = conn.prepareStatement(INSERT);
			pstmt.setInt(1, CountryBean.getCountryId());
			pstmt.setInt(2, CountryBean.getCountryCode());
			pstmt.setString(3, CountryBean.getCountryName());
			pstmt.setDate(4, (Date) CountryBean.getTimeBeIndependent());
			pstmt.setString(5, CountryBean.getState());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private static String UPDATE = "update Country set  CountryCode=?, CountryName=?, TimeBeIndependent=?, State=? where CountryId = ?";

	public void update(CountryBean CountryBean) {
		try (Connection conn = DriverManager.getConnection(URL, "sa", "passw0rd");) {
			PreparedStatement pstmt = conn.prepareStatement(UPDATE);

			pstmt.setInt(1, CountryBean.getCountryCode());
			pstmt.setString(2, CountryBean.getCountryName());
			pstmt.setDate(3, (Date) CountryBean.getTimeBeIndependent());
			pstmt.setString(4, CountryBean.getState());
			pstmt.setInt(5, CountryBean.getCountryId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	private static String DELETE = "delete from Album where CountryId = ?";

	public void delete(Integer CountryId) {
		try (Connection conn = DriverManager.getConnection(URL, "sa", "passw0rd");) {
			PreparedStatement pstmt = conn.prepareStatement(DELETE);
			pstmt.setInt(1, CountryId);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	private static String FINDONE = "select * from Country where CountryId = ?";

	public CountryBean findOne(Integer CountryId) {
		CountryBean CountryBean = new CountryBean();
		try (Connection conn = DriverManager.getConnection(URL, "sa", "passw0rd");) {
			PreparedStatement pstmt = conn.prepareStatement(FINDONE);
			pstmt.setInt(1, CountryId);
			ResultSet rs = pstmt.executeQuery();
			if (rs == null) {
				return null;

			} else {
				while (rs.next()) {
					CountryBean.setCountryId(rs.getInt(1));
					CountryBean.setCountryCode(rs.getInt(2));
					CountryBean.setCountryName(rs.getString(3));
					CountryBean.setTimeBeIndependent(rs.getDate(4));
					CountryBean.setState(rs.getString(5));
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return CountryBean;
	}

	private static String FINDALL = "select * from Country";

	public List<CountryBean> findAll() {
		List<CountryBean> CountryBeanList = new ArrayList<CountryBean>();
		try (Connection conn = DriverManager.getConnection(URL, "sa", "passw0rd");) {

			PreparedStatement pstmt = conn.prepareStatement(FINDALL);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				CountryBean CountryBean = new CountryBean();
				CountryBean.setCountryId(rs.getInt(1));
				CountryBean.setCountryCode(rs.getInt(2));
				CountryBean.setCountryName(rs.getString(3));
				CountryBean.setTimeBeIndependent(rs.getDate(4));
				CountryBean.setState(rs.getString(5));

				CountryBeanList.add(CountryBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return CountryBeanList;
	}

	// 額外兩個方法
	// 用表演者搜尋影片
	public List<Performance> findByArtist(String name) {
			List<Performance> performanceList = new ArrayList<Performance>();
//			try {
//				Connection conn = dataSource.getConnection();
//				ArtistDao artistDao = new ArtistDao();
//				Artist bean = new Artist();
//				bean  = artistDao.findOne();
//				PreparedStatement pstmt = conn.prepareStatement(FIND_BY_ARTIST);
//				ResultSet rs = pstmt.executeQuery();
//
//				while (rs.next()) {
//					Performance performance = new Performance();
//					performance.setpId(rs.getInt(1));
//					performance.setaId(rs.getInt(2));
//					performance.setpName(rs.getString(3));
//					performance.setpUrl(rs.getString(4));
//					performance.setUpdateTime(rs.getTimestamp(5));
//					performance.setCounts(rs.getInt(6));
//					
//					performanceList.add(performance);
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
			return performanceList;
//		}
	}
}