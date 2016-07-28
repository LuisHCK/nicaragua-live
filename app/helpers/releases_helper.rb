module ReleasesHelper
  def download_link
      last_release = Release.last
      return last_release.dwnl_link
  end
  def link_to_last_release
    return lt_last_release = Release.last
  end
end
