---
title: Data Download
layout: default
---


<div prefix="dcat: http://www.w3.org/ns/dcat#
             foaf: http://xmlns.com/foaf/0.1/
             rdf: http://www.w3.org/1999/02/22-rdf-syntax-ns#
             dct: http://purl.org/dc/terms/">

<div typeof="dcat:Catalog" resource="http://alpha.openaddressesuk.org<%=request.path%>">

      <p property="dct:title">Open Addresses Data

      <p property="dct:description">
          The Open Addresses dataset is available through the <a href="/addresses">search function</a>; through <a href="/about/docs#publishingapis">the publishing APIs</a>; and for download on this page.
      </p>
<p>
             If you think that some of your or your organisation’s Intellectual Property has been published through the Open Addresses Platform please <a href="/about/reportaninfringement">report the infringement</a>.
</p>
      <p>
          The downloadable data is generated on a weekly basis.</b></a>.
      </p>
    <p property="dct:license" resource="https://www.nationalarchives.gov.uk/doc/open-government-licence/version/2/">
      The Open Addresses dataset is licensed as Open Data under the
      <a href="https://creativecommons.org/licenses/by/4.0/">
        <span property="dct:title">Creative Commons Attribution 4.0 International (CC BY 4.0) licence</span>
      </a>. The database contains data that, in its original form, was previously licensed under the UK Open Government Licence or the Ordnance Survey Open Data Licence, subject to Crown copyright and Crown database rights. Read more about our sources <a href="/about/docs#sources">here</a>.
    </p>
<p>
             If you think that some of your or your organisation’s Intellectual Property has been published through the Open Addresses Platform please <a href="/about/reportaninfringement">report the infringement</a>.
</p>

    <p property="dct:publisher" resource="http://openaddressesuk.org">
      Published by
      <a href="http://openaddressesuk.org" about="http://openaddressesuk.org" property="foaf:homepage">
        <span property="foaf:name">Open Addresses Ltd.</span>
      </a>
    </p>

    <script src='https://certificates.theodi.org/datasets/22687/certificate/badge.js'></script>

    <p>
        Each download type is available as one large file, or split by postcode sector.
    </p>
    <p>
        For each version of the dataset you have the option to either download the file directly or through BitTorrent. By using BitTorrent you help Open Addresses saving on the cost of distributing the data to our users. <a href="http://www.bittorrent.com/">You will need a Bittorrent client</a> in order to download the data using BitTorrent.
    </p>

    <div property="dcat:dataset" typeof="dcat:Dataset" resource="http://alpha.openaddressesuk.org<%=request.path%>#address-only">
      <h3 property="dct:title">Open Addresses dataset (downloadable, addresses-only)</h3>
      <p property="dct:description">
        This is the addresses-only version of the Open Addresses dataset. It includes the current list of addresses without provenance information. It is distributed as a single ZIP file, containing one ZIP file per postcode initial, containing one CSV file per <a href="http://en.wikipedia.org/wiki/Postcodes_in_the_United_Kingdom#Postcode_area">postcode area</a>. Each row in the CSV file is one address.
      </p>

          <h4>As a single file (direct download)</h4>
            <p>
              <span property='dcat:distribution' typeof='dcat:Distribution'>
                <a class='btn btn-primary' href='/addresses/download.csv?split=false&amp;provenance=false&amp;torrent=false' property='dcat:accessURL'>
                  <i class='fa fa-cloud-download'></i>
                  <span property="dct:type" content="indirect-access">Download</span>
                  <span property="dct:format" typeof="dct:IMT">
                    <span content="text/csv" property="rdf:value">CSV</span>
                  </span>
                </a>
              </span>
              <span property='dcat:distribution' typeof='dcat:Distribution'>
                <a class='btn btn-primary' href='/addresses/download.json?split=false&amp;provenance=false&amp;torrent=false' property='dcat:accessURL'>
                  <i class='fa fa-cloud-download'></i>
                  <span property="dct:type" content="indirect-access">Download</span>
                  <span property="dct:format" typeof="dct:IMT">
                    <span content="application/json" property="rdf:value">JSON</span>
                  </span>
                </a>
              </span>
            </p>
        </td>
        <h4>As a single file (torrent)</h4>
          <p>
            <span property='dcat:distribution' typeof='dcat:Distribution'>
              <a class='btn btn-primary' href='/addresses/download.csv?split=false&amp;provenance=false&amp;torrent=true' property='dcat:accessURL'>
                <i class='fa fa-cloud-download'></i>
                <span property="dct:type" content="indirect-access">Download</span>
                <span property="dct:format" typeof="dct:IMT">
                  <span content="text/csv" property="rdf:value">CSV</span>
                </span>
              </a>
            </span>
            <span property='dcat:distribution' typeof='dcat:Distribution'>
              <a class='btn btn-primary' href='/addresses/download.json?split=false&amp;provenance=false&amp;torrent=true' property='dcat:accessURL'>
                <i class='fa fa-cloud-download'></i>
                <span property="dct:type" content="indirect-access">Download</span>
                <span property="dct:format" typeof="dct:IMT">
                  <span content="application/json" property="rdf:value">JSON</span>
                </span>
              </a>
            </span>
          </p>
      <h4>Split by postcode sector (direct download)</h4>
        <p>
          <span property='dcat:distribution' typeof='dcat:Distribution'>
            <a class='btn btn-primary' href='/addresses/download.csv?split=true&amp;provenance=false&amp;torrent=false' property='dcat:accessURL'>
              <i class='fa fa-cloud-download'></i>
              <span property="dct:type" content="indirect-access">Download</span>
              <span property="dct:format" typeof="dct:IMT">
                <span content="text/csv" property="rdf:value">CSV</span>
              </span>
            </a>
          </span>
          <span property='dcat:distribution' typeof='dcat:Distribution'>
            <a class='btn btn-primary' href='/addresses/download.json?split=true&amp;provenance=false&amp;torrent=false' property='dcat:accessURL'>
              <i class='fa fa-cloud-download'></i>
              <span property="dct:type" content="indirect-access">Download</span>
              <span property="dct:format" typeof="dct:IMT">
                <span content="application/json" property="rdf:value">JSON</span>
              </span>
            </a>
          </span>
        </p>
        <h4>Split by postcode sector (torrent)</h4>
          <p>
            <span property='dcat:distribution' typeof='dcat:Distribution'>
              <a class='btn btn-primary' href='/addresses/download.csv?split=true&amp;provenance=false&amp;torrent=true' property='dcat:accessURL'>
                <i class='fa fa-cloud-download'></i>
                <span property="dct:type" content="indirect-access">Download</span>
                <span property="dct:format" typeof="dct:IMT">
                  <span content="text/csv" property="rdf:value">CSV</span>
                </span>
              </a>
            </span>
            <span property='dcat:distribution' typeof='dcat:Distribution'>
              <a class='btn btn-primary' href='/addresses/download.json?split=true&amp;provenance=false&amp;torrent=true' property='dcat:accessURL'>
                <i class='fa fa-cloud-download'></i>
                <span property="dct:type" content="indirect-access">Download</span>
                <span property="dct:format" typeof="dct:IMT">
                  <span content="application/json" property="rdf:value">JSON</span>
                </span>
              </a>
            </span>
          </p>
    </div>

    <div property="dcat:dataset" typeof="dcat:Dataset" resource="http://alpha.openaddressesuk.org<%=request.path%>#full">
        <h3 property="dct:title">Open Addresses dataset (downloadable, full)</h3>
        <p property="dct:description">
          As above, but including:
        </p>
          <ul>
            <li>references to the live, persistent URIs of each component of the address and of the address itself, and</li>
            <li>provenance information.</li>
          </ul>
        <p>
          The CSV files in this distribution do not have one line per address, but one line <b>for each provenance element being described</b>. The actual address is repeated for every row. Rows referring to the same addresses can be identified as they have the same address URI (the 'url' column).
        </p>

        <h4>As a single file (direct download)</h4>
            <p>
              <span property='dcat:distribution' typeof='dcat:Distribution'>
                <a class='btn btn-primary' href='/addresses/download.csv?split=false&amp;provenance=true&amp;torrent=false' property='dcat:accessURL'>
                  <i class='fa fa-cloud-download'></i>
                  <span property="dct:type" content="indirect-access">Download</span>
                  <span property="dct:format" typeof="dct:IMT">
                    <span content="text/csv" property="rdf:value">CSV</span>
                  </span>
                </a>
              </span>
              <span property='dcat:distribution' typeof='dcat:Distribution'>
                <a class='btn btn-primary' href='/addresses/download.json?split=false&amp;provenance=true&amp;torrent=false' property='dcat:accessURL'>
                  <i class='fa fa-cloud-download'></i>
                  <span property="dct:type" content="indirect-access">Download</span>
                  <span property="dct:format" typeof="dct:IMT">
                    <span content="application/json" property="rdf:value">JSON</span>
                  </span>
                </a>
              </span>
            </p>
        <h4>As a single file (torrent)</h4>
            <p>
              <span property='dcat:distribution' typeof='dcat:Distribution'>
                <a class='btn btn-primary' href='/addresses/download.csv?split=false&amp;provenance=true&amp;torrent=true' property='dcat:accessURL'>
                  <i class='fa fa-cloud-download'></i>
                  <span property="dct:type" content="indirect-access">Download</span>
                  <span property="dct:format" typeof="dct:IMT">
                    <span content="text/csv" property="rdf:value">CSV</span>
                  </span>
                </a>
              </span>
              <span property='dcat:distribution' typeof='dcat:Distribution'>
                <a class='btn btn-primary' href='/addresses/download.json?split=false&amp;provenance=true&amp;torrent=true' property='dcat:accessURL'>
                  <i class='fa fa-cloud-download'></i>
                  <span property="dct:type" content="indirect-access">Download</span>
                  <span property="dct:format" typeof="dct:IMT">
                    <span content="application/json" property="rdf:value">JSON</span>
                  </span>
                </a>
              </span>
            </p>

        <h4>Split by postcode sector (direct download)</h4>
            <p>
              <span property='dcat:distribution' typeof='dcat:Distribution'>
                <a class='btn btn-primary' href='/addresses/download.csv?split=true&amp;provenance=true&amp;torrent=false' property='dcat:accessURL'>
                  <i class='fa fa-cloud-download'></i>
                  <span property="dct:type" content="indirect-access">Download</span>
                  <span property="dct:format" typeof="dct:IMT">
                    <span content="text/csv" property="rdf:value">CSV</span>
                  </span>
                </a>
              </span>
              <span property='dcat:distribution' typeof='dcat:Distribution'>
                <a class='btn btn-primary' href='/addresses/download.json?split=true&amp;provenance=true&amp;torrent=false' property='dcat:accessURL'>
                  <i class='fa fa-cloud-download'></i>
                  <span property="dct:type" content="indirect-access">Download</span>
                  <span property="dct:format" typeof="dct:IMT">
                    <span content="application/json" property="rdf:value">JSON</span>
                  </span>
                </a>
              </span>
            </p>
        <h4>Split by postcode sector (torrent)</h4>
            <p>
              <span property='dcat:distribution' typeof='dcat:Distribution'>
                <a class='btn btn-primary' href='/addresses/download.csv?split=true&amp;provenance=true&amp;torrent=true' property='dcat:accessURL'>
                  <i class='fa fa-cloud-download'></i>
                  <span property="dct:type" content="indirect-access">Download</span>
                  <span property="dct:format" typeof="dct:IMT">
                    <span content="text/csv" property="rdf:value">CSV</span>
                  </span>
                </a>
              </span>
              <span property='dcat:distribution' typeof='dcat:Distribution'>
                <a class='btn btn-primary' href='/addresses/download.json?split=true&amp;provenance=true&amp;torrent=true' property='dcat:accessURL'>
                  <i class='fa fa-cloud-download'></i>
                  <span property="dct:type" content="indirect-access">Download</span>
                  <span property="dct:format" typeof="dct:IMT">
                    <span content="application/json" property="rdf:value">JSON</span>
                  </span>
                </a>
              </span>
            </p>

    </div>


  </div>
</div>

